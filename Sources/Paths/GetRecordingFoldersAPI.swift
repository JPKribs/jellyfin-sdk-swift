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
    /// Gets recording folders.
    static public func getRecordingFolders(userID: UUID? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/LiveTv/Recordings/Folders", query: makeGetRecordingFoldersQuery(userID), id: "GetRecordingFolders")
    }

    private static func makeGetRecordingFoldersQuery(_ userID: UUID?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
