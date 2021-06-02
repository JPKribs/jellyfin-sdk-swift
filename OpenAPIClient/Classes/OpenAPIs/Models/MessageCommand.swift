//
// MessageCommand.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import AnyCodable

public struct MessageCommand: Codable, Hashable {

    public var header: String?
    public var text: String
    public var timeoutMs: Int64?

    public init(header: String? = nil, text: String, timeoutMs: Int64? = nil) {
        self.header = header
        self.text = text
        self.timeoutMs = timeoutMs
    }
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case header = "Header"
        case text = "Text"
        case timeoutMs = "TimeoutMs"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(header, forKey: .header)
        try container.encode(text, forKey: .text)
        try container.encodeIfPresent(timeoutMs, forKey: .timeoutMs)
    }



}
