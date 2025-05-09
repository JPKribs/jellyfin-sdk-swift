//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Combine
import Foundation

/// A WebSocket manager for receiving real-time Jellyfin server events.
/// Uses URLSessionWebSocketTask under the hood.
public final class JellyfinSocket: ObservableObject {
    // MARK: - Public Types

    public enum State: Equatable {
        case idle
        case connecting
        case connected
        case reconnecting(attempt: Int)
        case error(String)
        case closed
    }

    @Published public private(set) var state: State = .idle
    public var messages: AnyPublisher<InboundWebSocketMessage, Never> {
        inboundSubject.eraseToAnyPublisher()
    }

    // MARK: - Private

    private let client: JellyfinClient
    private let socketPath = "/socket"
    private let maxReconnectAttempts = 5
    private let pingInterval: TimeInterval = 15
    private let validationTimeout: TimeInterval = 5

    private var task: URLSessionWebSocketTask?
    private var reconnectAttempts = 0
    private var hasReceivedFirstMessage = false

    private var pingWorkItem: DispatchWorkItem?
    private var validationWorkItem: DispatchWorkItem?
    private var reconnectWorkItem: DispatchWorkItem?

    private let session = URLSession(configuration: .default)
    private var handlers: [(InboundWebSocketMessage) -> Void] = []
    private let inboundSubject = PassthroughSubject<InboundWebSocketMessage, Never>()

    private var stateCancellable: AnyCancellable?

    // MARK: - Init

    public init(client: JellyfinClient) {
        self.client = client
    }

    // MARK: - Public API

    /// Subscribe to all messages (or install custom handlers).
    /// First call triggers `openSocket()`. Subsequent calls only replace handlers.
    @MainActor
    public func subscribe(only handlers: [(InboundWebSocketMessage) -> Void]? = nil) {
        if let h = handlers { self.handlers = h }
        guard state == .idle || state == .error("") else { return }

        // Monitor when we become connected to auto‐subscribe server‐side events
        stateCancellable?.cancel()
        stateCancellable = $state
            .filter { $0 == .connected }
            .first()
            .sink { [weak self] _ in self?.sendInitialSubscriptions() }

        openSocket()
    }

    /// Filtered Combine publisher.
    @MainActor
    public func subscribe(_ cases: InboundWebSocketMessage...)
        -> AnyPublisher<InboundWebSocketMessage, Never>
    {
        subscribe(only: nil)
        guard !cases.isEmpty else { return messages }
        return messages.filter { cases.contains($0) }.eraseToAnyPublisher()
    }

    /// Send an outbound message.
    @discardableResult
    public func send(_ message: OutboundWebSocketMessage) -> Bool {
        guard case .connected = state, let task = task else {
            print("[WebSocket] Not connected; cannot send.")
            return false
        }
        do {
            let data = try JSONEncoder().encode(message)
            task.send(.string(String(data: data, encoding: .utf8)!)) { error in
                if let e = error { print("[WebSocket] send error: \(e)") }
            }
            return true
        } catch {
            print("[WebSocket] encode error: \(error)")
            return false
        }
    }

    /// Gracefully close.
    @MainActor
    public func disconnect() {
        stateCancellable?.cancel()
        pingWorkItem?.cancel()
        validationWorkItem?.cancel()
        reconnectWorkItem?.cancel()
        task?.cancel(with: .goingAway, reason: nil)
        state = .closed
    }

    // MARK: - Internal

    private func openSocket() {
        guard let token = client.accessToken else {
            state = .error("Missing access token")
            return
        }
        state = reconnectAttempts == 0 ? .connecting : .reconnecting(attempt: reconnectAttempts)
        hasReceivedFirstMessage = false

        var comps = URLComponents(url: client.configuration.url, resolvingAgainstBaseURL: false)!
        comps.scheme = (comps.scheme == "https" ? "wss" : "ws")
        comps.path = socketPath

        var req = URLRequest(url: comps.url!)
        req.setValue("MediaBrowser Token=\(token)", forHTTPHeaderField: "Authorization")
        task = session.webSocketTask(with: req)
        task?.resume()

        listenLoop()
        scheduleValidationTimeout()
    }

    private func listenLoop() {
        task?.receive { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(.string(let text)):
                self.handle(text)
                self.listenLoop()
            case .success:
                self.listenLoop()
            case .failure(let err):
                self.handleError(err.localizedDescription)
            }
        }
    }

    private func handle(_ text: String) {
        if !hasReceivedFirstMessage {
            hasReceivedFirstMessage = true
            validationWorkItem?.cancel()
            state = .connected
            reconnectAttempts = 0
            schedulePings()
        }

        // Special‐case ForceKeepAlive
        if text.contains("ForceKeepAlive") {
            _ = sendKeepAliveResponse()
        }

        guard
            let data = text.data(using: .utf8),
            let msg = try? JSONDecoder().decode(InboundWebSocketMessage.self, from: data)
        else {
            print("[WebSocket] decode failure for: \(text)")
            return
        }

        handlers.forEach { $0(msg) }
        inboundSubject.send(msg)
    }

    private func handleError(_ description: String) {
        state = .error(description)
        scheduleReconnect()
    }

    private func scheduleValidationTimeout() {
        validationWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in
            guard let s = self, !s.hasReceivedFirstMessage else { return }
            s.handleError("Connection timed out")
        }
        validationWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + validationTimeout, execute: w)
    }

    private func schedulePings() {
        pingWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in
            guard let s = self, case .connected = s.state else { return }
            s.task?.sendPing { err in
                if let e = err { s.handleError("Ping failed: \(e)") }
            }
            _ = self?.sendKeepAlive()
            self?.schedulePings()
        }
        pingWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + pingInterval, execute: w)
    }

    private func scheduleReconnect() {
        guard reconnectAttempts < maxReconnectAttempts else {
            state = .error("Max reconnect attempts reached")
            return
        }
        reconnectAttempts += 1
        let delay = pow(2.0, Double(reconnectAttempts))
        reconnectWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in self?.openSocket() }
        reconnectWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: w)
    }

    private func sendInitialSubscriptions() {
        let types = SessionMessageType.allCases.filter { $0.rawValue.hasSuffix("Start") }
        types.forEach { type in
            let cmd = GeneralCommandMessage(
                messageID: UUID().uuidString.replacingOccurrences(of: "-", with: ""),
                messageType: .generalCommand
            )
            _ = send(.generalCommandMessage(cmd))
        }
    }

    // MARK: - KeepAlive Helpers

    @discardableResult
    private func sendKeepAliveResponse() -> Bool {
        let msg = OutboundKeepAliveMessage(
            messageID: UUID().uuidString.replacingOccurrences(of: "-", with: ""),
            messageType: .keepAlive
        )
        return send(.outboundKeepAliveMessage(msg))
    }

    @discardableResult
    private func sendKeepAlive() -> Bool {
        let msg = OutboundKeepAliveMessage(
            messageID: UUID().uuidString.replacingOccurrences(of: "-", with: ""),
            messageType: .keepAlive
        )
        return send(.outboundKeepAliveMessage(msg))
    }
}
