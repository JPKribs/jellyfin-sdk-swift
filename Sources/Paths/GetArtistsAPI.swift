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
    /// Gets all artists from a given item, folder, or the entire library.
    static public func getArtists(parameters: GetArtistsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/Artists", query: parameters?.asQuery, id: "GetArtists")
    }

    public struct GetArtistsParameters {
        public var minCommunityRating: Double?
        public var startIndex: Int32?
        public var limit: Int32?
        public var searchTerm: String?
        public var parentID: UUID?
        public var fields: [JellyfinAPI.ItemFields]?
        public var excludeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var includeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var filters: [JellyfinAPI.ItemFilter]?
        public var isFavorite: Bool?
        public var mediaTypes: [String]?
        public var genres: [String]?
        public var genreIDs: [UUID]?
        public var officialRatings: [String]?
        public var tags: [String]?
        public var years: [Int32]?
        public var enableUserData: Bool?
        public var imageTypeLimit: Int32?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var person: String?
        public var personIDs: [UUID]?
        public var personTypes: [String]?
        public var studios: [String]?
        public var studioIDs: [UUID]?
        public var userID: UUID?
        public var nameStartsWithOrGreater: String?
        public var nameStartsWith: String?
        public var nameLessThan: String?
        public var sortBy: [String]?
        public var sortOrder: [JellyfinAPI.SortOrder]?
        public var enableImages: Bool?
        public var enableTotalRecordCount: Bool?

        public init(minCommunityRating: Double? = nil, startIndex: Int32? = nil, limit: Int32? = nil, searchTerm: String? = nil, parentID: UUID? = nil, fields: [JellyfinAPI.ItemFields]? = nil, excludeItemTypes: [JellyfinAPI.BaseItemKind]? = nil, includeItemTypes: [JellyfinAPI.BaseItemKind]? = nil, filters: [JellyfinAPI.ItemFilter]? = nil, isFavorite: Bool? = nil, mediaTypes: [String]? = nil, genres: [String]? = nil, genreIDs: [UUID]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int32]? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int32? = nil, enableImageTypes: [JellyfinAPI.ImageType]? = nil, person: String? = nil, personIDs: [UUID]? = nil, personTypes: [String]? = nil, studios: [String]? = nil, studioIDs: [UUID]? = nil, userID: UUID? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, sortBy: [String]? = nil, sortOrder: [JellyfinAPI.SortOrder]? = nil, enableImages: Bool? = nil, enableTotalRecordCount: Bool? = nil) {
            self.minCommunityRating = minCommunityRating
            self.startIndex = startIndex
            self.limit = limit
            self.searchTerm = searchTerm
            self.parentID = parentID
            self.fields = fields
            self.excludeItemTypes = excludeItemTypes
            self.includeItemTypes = includeItemTypes
            self.filters = filters
            self.isFavorite = isFavorite
            self.mediaTypes = mediaTypes
            self.genres = genres
            self.genreIDs = genreIDs
            self.officialRatings = officialRatings
            self.tags = tags
            self.years = years
            self.enableUserData = enableUserData
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.person = person
            self.personIDs = personIDs
            self.personTypes = personTypes
            self.studios = studios
            self.studioIDs = studioIDs
            self.userID = userID
            self.nameStartsWithOrGreater = nameStartsWithOrGreater
            self.nameStartsWith = nameStartsWith
            self.nameLessThan = nameLessThan
            self.sortBy = sortBy
            self.sortOrder = sortOrder
            self.enableImages = enableImages
            self.enableTotalRecordCount = enableTotalRecordCount
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(minCommunityRating, forKey: "minCommunityRating")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(searchTerm, forKey: "searchTerm")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(excludeItemTypes, forKey: "excludeItemTypes")
            encoder.encode(includeItemTypes, forKey: "includeItemTypes")
            encoder.encode(filters, forKey: "filters")
            encoder.encode(isFavorite, forKey: "isFavorite")
            encoder.encode(mediaTypes, forKey: "mediaTypes")
            encoder.encode(genres, forKey: "genres")
            encoder.encode(genreIDs, forKey: "genreIds")
            encoder.encode(officialRatings, forKey: "officialRatings")
            encoder.encode(tags, forKey: "tags")
            encoder.encode(years, forKey: "years")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(person, forKey: "person")
            encoder.encode(personIDs, forKey: "personIds")
            encoder.encode(personTypes, forKey: "personTypes")
            encoder.encode(studios, forKey: "studios")
            encoder.encode(studioIDs, forKey: "studioIds")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(nameStartsWithOrGreater, forKey: "nameStartsWithOrGreater")
            encoder.encode(nameStartsWith, forKey: "nameStartsWith")
            encoder.encode(nameLessThan, forKey: "nameLessThan")
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(sortOrder, forKey: "sortOrder")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            return encoder.items
        }
    }
}
