//
// LogLevel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import AnyCodable

public enum LogLevel: String, Codable, CaseIterable {
    case trace = "Trace"
    case debug = "Debug"
    case information = "Information"
    case warning = "Warning"
    case error = "Error"
    case critical = "Critical"
    case _none = "None"
}
