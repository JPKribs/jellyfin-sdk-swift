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
    /// Gets latest channel items.
    static public func getLatestChannelItems(parameters: GetLatestChannelItemsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/Channels/Items/Latest", query: parameters?.asQuery, id: "GetLatestChannelItems")
    }

    public struct GetLatestChannelItemsParameters {
        public var userID: UUID?
        public var startIndex: Int32?
        public var limit: Int32?
        public var filters: [JellyfinAPI.ItemFilter]?
        public var fields: [JellyfinAPI.ItemFields]?
        public var channelIDs: [UUID]?

        public init(userID: UUID? = nil, startIndex: Int32? = nil, limit: Int32? = nil, filters: [JellyfinAPI.ItemFilter]? = nil, fields: [JellyfinAPI.ItemFields]? = nil, channelIDs: [UUID]? = nil) {
            self.userID = userID
            self.startIndex = startIndex
            self.limit = limit
            self.filters = filters
            self.fields = fields
            self.channelIDs = channelIDs
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(filters, forKey: "filters")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(channelIDs, forKey: "channelIds")
            return encoder.items
        }
    }
}
