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
    /// Gets all studios from a given item, folder, or the entire library.
    static public func getStudios(parameters: GetStudiosParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/Studios", query: parameters?.asQuery, id: "GetStudios")
    }

    public struct GetStudiosParameters {
        public var startIndex: Int32?
        public var limit: Int32?
        public var searchTerm: String?
        public var parentID: UUID?
        public var fields: [JellyfinAPI.ItemFields]?
        public var excludeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var includeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var isFavorite: Bool?
        public var enableUserData: Bool?
        public var imageTypeLimit: Int32?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var userID: UUID?
        public var nameStartsWithOrGreater: String?
        public var nameStartsWith: String?
        public var nameLessThan: String?
        public var enableImages: Bool?
        public var enableTotalRecordCount: Bool?

        public init(startIndex: Int32? = nil, limit: Int32? = nil, searchTerm: String? = nil, parentID: UUID? = nil, fields: [JellyfinAPI.ItemFields]? = nil, excludeItemTypes: [JellyfinAPI.BaseItemKind]? = nil, includeItemTypes: [JellyfinAPI.BaseItemKind]? = nil, isFavorite: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int32? = nil, enableImageTypes: [JellyfinAPI.ImageType]? = nil, userID: UUID? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, enableImages: Bool? = nil, enableTotalRecordCount: Bool? = nil) {
            self.startIndex = startIndex
            self.limit = limit
            self.searchTerm = searchTerm
            self.parentID = parentID
            self.fields = fields
            self.excludeItemTypes = excludeItemTypes
            self.includeItemTypes = includeItemTypes
            self.isFavorite = isFavorite
            self.enableUserData = enableUserData
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.userID = userID
            self.nameStartsWithOrGreater = nameStartsWithOrGreater
            self.nameStartsWith = nameStartsWith
            self.nameLessThan = nameLessThan
            self.enableImages = enableImages
            self.enableTotalRecordCount = enableTotalRecordCount
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(searchTerm, forKey: "searchTerm")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(excludeItemTypes, forKey: "excludeItemTypes")
            encoder.encode(includeItemTypes, forKey: "includeItemTypes")
            encoder.encode(isFavorite, forKey: "isFavorite")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(nameStartsWithOrGreater, forKey: "nameStartsWithOrGreater")
            encoder.encode(nameStartsWith, forKey: "nameStartsWith")
            encoder.encode(nameLessThan, forKey: "nameLessThan")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            return encoder.items
        }
    }
}
