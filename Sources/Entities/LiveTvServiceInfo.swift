//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ServiceInfo.
public struct LiveTvServiceInfo: Codable {
    /// Gets or sets a value indicating whether this instance has update available.
    public var hasUpdateAvailable: Bool?
    /// Gets or sets the home page URL.
    public var homePageURL: String?
    /// Gets or sets a value indicating whether this instance is visible.
    public var isVisible: Bool?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the status.
    public var status: LiveTvServiceStatus?
    /// Gets or sets the status message.
    public var statusMessage: String?
    public var tuners: [String]?
    /// Gets or sets the version.
    public var version: String?

    public init(hasUpdateAvailable: Bool? = nil, homePageURL: String? = nil, isVisible: Bool? = nil, name: String? = nil, status: LiveTvServiceStatus? = nil, statusMessage: String? = nil, tuners: [String]? = nil, version: String? = nil) {
        self.hasUpdateAvailable = hasUpdateAvailable
        self.homePageURL = homePageURL
        self.isVisible = isVisible
        self.name = name
        self.status = status
        self.statusMessage = statusMessage
        self.tuners = tuners
        self.version = version
    }
}
