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
    /// Get item counts.
    static public func getItemCounts(userID: UUID? = nil, isFavorite: Bool? = nil) -> Request<JellyfinAPI.ItemCounts> {
        Request(method: "GET", url: "/Items/Counts", query: makeGetItemCountsQuery(userID, isFavorite), id: "GetItemCounts")
    }

    private static func makeGetItemCountsQuery(_ userID: UUID?, _ isFavorite: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        encoder.encode(isFavorite, forKey: "isFavorite")
        return encoder.items
    }
}
