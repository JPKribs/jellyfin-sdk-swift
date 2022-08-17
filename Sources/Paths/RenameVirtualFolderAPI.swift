//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Renames a virtual folder.
    static public func renameVirtualFolder(parameters: RenameVirtualFolderParameters? = nil) -> Request<Void> {
        Request(method: "POST", url: "/Library/VirtualFolders/Name", query: parameters?.asQuery, id: "RenameVirtualFolder")
    }

    public struct RenameVirtualFolderParameters {
        public var name: String?
        public var newName: String?
        public var isRefreshLibrary: Bool?

        public init(name: String? = nil, newName: String? = nil, isRefreshLibrary: Bool? = nil) {
            self.name = name
            self.newName = newName
            self.isRefreshLibrary = isRefreshLibrary
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(name, forKey: "name")
            encoder.encode(newName, forKey: "newName")
            encoder.encode(isRefreshLibrary, forKey: "refreshLibrary")
            return encoder.items
        }
    }
}
