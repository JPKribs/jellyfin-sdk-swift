//
// WakeOnLanInfo.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import AnyCodable

/** Provides the MAC address and port for wake-on-LAN functionality. */
public struct WakeOnLanInfo: Codable, Hashable {

    /** Gets the MAC address of the device. */
    public var macAddress: String?
    /** Gets or sets the wake-on-LAN port. */
    public var port: Int?

    public init(macAddress: String? = nil, port: Int? = nil) {
        self.macAddress = macAddress
        self.port = port
    }
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case macAddress = "MacAddress"
        case port = "Port"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(macAddress, forKey: .macAddress)
        try container.encodeIfPresent(port, forKey: .port)
    }



}
