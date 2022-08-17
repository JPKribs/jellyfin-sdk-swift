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
    /// Reports that new episodes of a series have been added by an external source.
    static public func postUpdatedSeries(tvdbID: String? = nil) -> Request<Void> {
        Request(method: "POST", url: "/Library/Series/Updated", query: makePostUpdatedSeriesQuery(tvdbID), id: "PostUpdatedSeries")
    }

    private static func makePostUpdatedSeriesQuery(_ tvdbID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(tvdbID, forKey: "tvdbId")
        return encoder.items
    }
}
