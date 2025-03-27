//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum containing tonemapping algorithms.
public enum TonemappingAlgorithm: String, Codable, CaseIterable {
    case none
    case clip
    case linear
    case gamma
    case reinhard
    case hable
    case mobius
    case bt2390
}
