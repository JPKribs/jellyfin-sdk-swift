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
    /// Adds items to a playlist.
    static public func addToPlaylist(playlistID: String, ids: [UUID]? = nil, userID: UUID? = nil) -> Request<Void> {
        Request(method: "POST", url: "/Playlists/\(playlistID)/Items", query: makeAddToPlaylistQuery(ids, userID), id: "AddToPlaylist")
    }

    private static func makeAddToPlaylistQuery(_ ids: [UUID]?, _ userID: UUID?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(ids, forKey: "ids")
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
