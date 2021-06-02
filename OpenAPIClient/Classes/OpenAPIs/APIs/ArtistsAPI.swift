//
// ArtistsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class ArtistsAPI {
    /**
     Gets all album artists from a given item, folder, or the entire library.
     
     - parameter minCommunityRating: (query) Optional filter by minimum community rating. (optional)
     - parameter startIndex: (query) Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
     - parameter limit: (query) Optional. The maximum number of records to return. (optional)
     - parameter searchTerm: (query) Optional. Search term. (optional)
     - parameter parentId: (query) Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
     - parameter fields: (query) Optional. Specify additional fields of information to return in the output. (optional)
     - parameter excludeItemTypes: (query) Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. (optional)
     - parameter includeItemTypes: (query) Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. (optional)
     - parameter filters: (query) Optional. Specify additional filters to apply. (optional)
     - parameter isFavorite: (query) Optional filter by items that are marked as favorite, or not. (optional)
     - parameter mediaTypes: (query) Optional filter by MediaType. Allows multiple, comma delimited. (optional)
     - parameter genres: (query) Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. (optional)
     - parameter genreIds: (query) Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. (optional)
     - parameter officialRatings: (query) Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. (optional)
     - parameter tags: (query) Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. (optional)
     - parameter years: (query) Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. (optional)
     - parameter enableUserData: (query) Optional, include user data. (optional)
     - parameter imageTypeLimit: (query) Optional, the max number of images to return, per image type. (optional)
     - parameter enableImageTypes: (query) Optional. The image types to include in the output. (optional)
     - parameter person: (query) Optional. If specified, results will be filtered to include only those containing the specified person. (optional)
     - parameter personIds: (query) Optional. If specified, results will be filtered to include only those containing the specified person ids. (optional)
     - parameter personTypes: (query) Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. (optional)
     - parameter studios: (query) Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. (optional)
     - parameter studioIds: (query) Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. (optional)
     - parameter userId: (query) User id. (optional)
     - parameter nameStartsWithOrGreater: (query) Optional filter by items whose name is sorted equally or greater than a given input string. (optional)
     - parameter nameStartsWith: (query) Optional filter by items whose name is sorted equally than a given input string. (optional)
     - parameter nameLessThan: (query) Optional filter by items whose name is equally or lesser than a given input string. (optional)
     - parameter enableImages: (query) Optional, include image information in output. (optional, default to true)
     - parameter enableTotalRecordCount: (query) Total record count. (optional, default to true)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAlbumArtists(minCommunityRating: Double? = nil, startIndex: Int? = nil, limit: Int? = nil, searchTerm: String? = nil, parentId: UUID? = nil, fields: [ItemFields]? = nil, excludeItemTypes: [String]? = nil, includeItemTypes: [String]? = nil, filters: [ItemFilter]? = nil, isFavorite: Bool? = nil, mediaTypes: [String]? = nil, genres: [String]? = nil, genreIds: [UUID]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int]? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, person: String? = nil, personIds: [UUID]? = nil, personTypes: [String]? = nil, studios: [String]? = nil, studioIds: [UUID]? = nil, userId: UUID? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, enableImages: Bool? = nil, enableTotalRecordCount: Bool? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)) {
        getAlbumArtistsWithRequestBuilder(minCommunityRating: minCommunityRating, startIndex: startIndex, limit: limit, searchTerm: searchTerm, parentId: parentId, fields: fields, excludeItemTypes: excludeItemTypes, includeItemTypes: includeItemTypes, filters: filters, isFavorite: isFavorite, mediaTypes: mediaTypes, genres: genres, genreIds: genreIds, officialRatings: officialRatings, tags: tags, years: years, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, person: person, personIds: personIds, personTypes: personTypes, studios: studios, studioIds: studioIds, userId: userId, nameStartsWithOrGreater: nameStartsWithOrGreater, nameStartsWith: nameStartsWith, nameLessThan: nameLessThan, enableImages: enableImages, enableTotalRecordCount: enableTotalRecordCount).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Gets all album artists from a given item, folder, or the entire library.
     - GET /Artists/AlbumArtists
     - API Key:
       - type: apiKey X-Emby-Authorization 
       - name: CustomAuthentication
     - parameter minCommunityRating: (query) Optional filter by minimum community rating. (optional)
     - parameter startIndex: (query) Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
     - parameter limit: (query) Optional. The maximum number of records to return. (optional)
     - parameter searchTerm: (query) Optional. Search term. (optional)
     - parameter parentId: (query) Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
     - parameter fields: (query) Optional. Specify additional fields of information to return in the output. (optional)
     - parameter excludeItemTypes: (query) Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. (optional)
     - parameter includeItemTypes: (query) Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. (optional)
     - parameter filters: (query) Optional. Specify additional filters to apply. (optional)
     - parameter isFavorite: (query) Optional filter by items that are marked as favorite, or not. (optional)
     - parameter mediaTypes: (query) Optional filter by MediaType. Allows multiple, comma delimited. (optional)
     - parameter genres: (query) Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. (optional)
     - parameter genreIds: (query) Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. (optional)
     - parameter officialRatings: (query) Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. (optional)
     - parameter tags: (query) Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. (optional)
     - parameter years: (query) Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. (optional)
     - parameter enableUserData: (query) Optional, include user data. (optional)
     - parameter imageTypeLimit: (query) Optional, the max number of images to return, per image type. (optional)
     - parameter enableImageTypes: (query) Optional. The image types to include in the output. (optional)
     - parameter person: (query) Optional. If specified, results will be filtered to include only those containing the specified person. (optional)
     - parameter personIds: (query) Optional. If specified, results will be filtered to include only those containing the specified person ids. (optional)
     - parameter personTypes: (query) Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. (optional)
     - parameter studios: (query) Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. (optional)
     - parameter studioIds: (query) Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. (optional)
     - parameter userId: (query) User id. (optional)
     - parameter nameStartsWithOrGreater: (query) Optional filter by items whose name is sorted equally or greater than a given input string. (optional)
     - parameter nameStartsWith: (query) Optional filter by items whose name is sorted equally than a given input string. (optional)
     - parameter nameLessThan: (query) Optional filter by items whose name is equally or lesser than a given input string. (optional)
     - parameter enableImages: (query) Optional, include image information in output. (optional, default to true)
     - parameter enableTotalRecordCount: (query) Total record count. (optional, default to true)
     - returns: RequestBuilder<BaseItemDtoQueryResult> 
     */
    open class func getAlbumArtistsWithRequestBuilder(minCommunityRating: Double? = nil, startIndex: Int? = nil, limit: Int? = nil, searchTerm: String? = nil, parentId: UUID? = nil, fields: [ItemFields]? = nil, excludeItemTypes: [String]? = nil, includeItemTypes: [String]? = nil, filters: [ItemFilter]? = nil, isFavorite: Bool? = nil, mediaTypes: [String]? = nil, genres: [String]? = nil, genreIds: [UUID]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int]? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, person: String? = nil, personIds: [UUID]? = nil, personTypes: [String]? = nil, studios: [String]? = nil, studioIds: [UUID]? = nil, userId: UUID? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, enableImages: Bool? = nil, enableTotalRecordCount: Bool? = nil) -> RequestBuilder<BaseItemDtoQueryResult> {
        let path = "/Artists/AlbumArtists"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String: Any]? = nil

        var urlComponents = URLComponents(string: URLString)
        urlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "minCommunityRating": minCommunityRating?.encodeToJSON(),
            "startIndex": startIndex?.encodeToJSON(),
            "limit": limit?.encodeToJSON(),
            "searchTerm": searchTerm?.encodeToJSON(),
            "parentId": parentId?.encodeToJSON(),
            "fields": fields?.encodeToJSON(),
            "excludeItemTypes": excludeItemTypes?.encodeToJSON(),
            "includeItemTypes": includeItemTypes?.encodeToJSON(),
            "filters": filters?.encodeToJSON(),
            "isFavorite": isFavorite?.encodeToJSON(),
            "mediaTypes": mediaTypes?.encodeToJSON(),
            "genres": genres?.encodeToJSON(),
            "genreIds": genreIds?.encodeToJSON(),
            "officialRatings": officialRatings?.encodeToJSON(),
            "tags": tags?.encodeToJSON(),
            "years": years?.encodeToJSON(),
            "enableUserData": enableUserData?.encodeToJSON(),
            "imageTypeLimit": imageTypeLimit?.encodeToJSON(),
            "enableImageTypes": enableImageTypes?.encodeToJSON(),
            "person": person?.encodeToJSON(),
            "personIds": personIds?.encodeToJSON(),
            "personTypes": personTypes?.encodeToJSON(),
            "studios": studios?.encodeToJSON(),
            "studioIds": studioIds?.encodeToJSON(),
            "userId": userId?.encodeToJSON(),
            "nameStartsWithOrGreater": nameStartsWithOrGreater?.encodeToJSON(),
            "nameStartsWith": nameStartsWith?.encodeToJSON(),
            "nameLessThan": nameLessThan?.encodeToJSON(),
            "enableImages": enableImages?.encodeToJSON(),
            "enableTotalRecordCount": enableTotalRecordCount?.encodeToJSON(),
        ])

        let nillableHeaders: [String: Any?] = [
            :
        ]

        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<BaseItemDtoQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (urlComponents?.string ?? URLString), parameters: parameters, headers: headerParameters)
    }

    /**
     Gets an artist by name.
     
     - parameter name: (path) Studio name. 
     - parameter userId: (query) Optional. Filter by user id, and attach user data. (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getArtistByName(name: String, userId: UUID? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: BaseItemDto?, _ error: Error?) -> Void)) {
        getArtistByNameWithRequestBuilder(name: name, userId: userId).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Gets an artist by name.
     - GET /Artists/{name}
     - API Key:
       - type: apiKey X-Emby-Authorization 
       - name: CustomAuthentication
     - parameter name: (path) Studio name. 
     - parameter userId: (query) Optional. Filter by user id, and attach user data. (optional)
     - returns: RequestBuilder<BaseItemDto> 
     */
    open class func getArtistByNameWithRequestBuilder(name: String, userId: UUID? = nil) -> RequestBuilder<BaseItemDto> {
        var path = "/Artists/{name}"
        let namePreEscape = "\(APIHelper.mapValueToPathItem(name))"
        let namePostEscape = namePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{name}", with: namePostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String: Any]? = nil

        var urlComponents = URLComponents(string: URLString)
        urlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "userId": userId?.encodeToJSON(),
        ])

        let nillableHeaders: [String: Any?] = [
            :
        ]

        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<BaseItemDto>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (urlComponents?.string ?? URLString), parameters: parameters, headers: headerParameters)
    }

    /**
     Gets all artists from a given item, folder, or the entire library.
     
     - parameter minCommunityRating: (query) Optional filter by minimum community rating. (optional)
     - parameter startIndex: (query) Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
     - parameter limit: (query) Optional. The maximum number of records to return. (optional)
     - parameter searchTerm: (query) Optional. Search term. (optional)
     - parameter parentId: (query) Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
     - parameter fields: (query) Optional. Specify additional fields of information to return in the output. (optional)
     - parameter excludeItemTypes: (query) Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. (optional)
     - parameter includeItemTypes: (query) Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. (optional)
     - parameter filters: (query) Optional. Specify additional filters to apply. (optional)
     - parameter isFavorite: (query) Optional filter by items that are marked as favorite, or not. (optional)
     - parameter mediaTypes: (query) Optional filter by MediaType. Allows multiple, comma delimited. (optional)
     - parameter genres: (query) Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. (optional)
     - parameter genreIds: (query) Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. (optional)
     - parameter officialRatings: (query) Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. (optional)
     - parameter tags: (query) Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. (optional)
     - parameter years: (query) Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. (optional)
     - parameter enableUserData: (query) Optional, include user data. (optional)
     - parameter imageTypeLimit: (query) Optional, the max number of images to return, per image type. (optional)
     - parameter enableImageTypes: (query) Optional. The image types to include in the output. (optional)
     - parameter person: (query) Optional. If specified, results will be filtered to include only those containing the specified person. (optional)
     - parameter personIds: (query) Optional. If specified, results will be filtered to include only those containing the specified person ids. (optional)
     - parameter personTypes: (query) Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. (optional)
     - parameter studios: (query) Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. (optional)
     - parameter studioIds: (query) Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. (optional)
     - parameter userId: (query) User id. (optional)
     - parameter nameStartsWithOrGreater: (query) Optional filter by items whose name is sorted equally or greater than a given input string. (optional)
     - parameter nameStartsWith: (query) Optional filter by items whose name is sorted equally than a given input string. (optional)
     - parameter nameLessThan: (query) Optional filter by items whose name is equally or lesser than a given input string. (optional)
     - parameter enableImages: (query) Optional, include image information in output. (optional, default to true)
     - parameter enableTotalRecordCount: (query) Total record count. (optional, default to true)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getArtists(minCommunityRating: Double? = nil, startIndex: Int? = nil, limit: Int? = nil, searchTerm: String? = nil, parentId: UUID? = nil, fields: [ItemFields]? = nil, excludeItemTypes: [String]? = nil, includeItemTypes: [String]? = nil, filters: [ItemFilter]? = nil, isFavorite: Bool? = nil, mediaTypes: [String]? = nil, genres: [String]? = nil, genreIds: [UUID]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int]? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, person: String? = nil, personIds: [UUID]? = nil, personTypes: [String]? = nil, studios: [String]? = nil, studioIds: [UUID]? = nil, userId: UUID? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, enableImages: Bool? = nil, enableTotalRecordCount: Bool? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)) {
        getArtistsWithRequestBuilder(minCommunityRating: minCommunityRating, startIndex: startIndex, limit: limit, searchTerm: searchTerm, parentId: parentId, fields: fields, excludeItemTypes: excludeItemTypes, includeItemTypes: includeItemTypes, filters: filters, isFavorite: isFavorite, mediaTypes: mediaTypes, genres: genres, genreIds: genreIds, officialRatings: officialRatings, tags: tags, years: years, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, person: person, personIds: personIds, personTypes: personTypes, studios: studios, studioIds: studioIds, userId: userId, nameStartsWithOrGreater: nameStartsWithOrGreater, nameStartsWith: nameStartsWith, nameLessThan: nameLessThan, enableImages: enableImages, enableTotalRecordCount: enableTotalRecordCount).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Gets all artists from a given item, folder, or the entire library.
     - GET /Artists
     - API Key:
       - type: apiKey X-Emby-Authorization 
       - name: CustomAuthentication
     - parameter minCommunityRating: (query) Optional filter by minimum community rating. (optional)
     - parameter startIndex: (query) Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
     - parameter limit: (query) Optional. The maximum number of records to return. (optional)
     - parameter searchTerm: (query) Optional. Search term. (optional)
     - parameter parentId: (query) Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
     - parameter fields: (query) Optional. Specify additional fields of information to return in the output. (optional)
     - parameter excludeItemTypes: (query) Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. (optional)
     - parameter includeItemTypes: (query) Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. (optional)
     - parameter filters: (query) Optional. Specify additional filters to apply. (optional)
     - parameter isFavorite: (query) Optional filter by items that are marked as favorite, or not. (optional)
     - parameter mediaTypes: (query) Optional filter by MediaType. Allows multiple, comma delimited. (optional)
     - parameter genres: (query) Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. (optional)
     - parameter genreIds: (query) Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. (optional)
     - parameter officialRatings: (query) Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. (optional)
     - parameter tags: (query) Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. (optional)
     - parameter years: (query) Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. (optional)
     - parameter enableUserData: (query) Optional, include user data. (optional)
     - parameter imageTypeLimit: (query) Optional, the max number of images to return, per image type. (optional)
     - parameter enableImageTypes: (query) Optional. The image types to include in the output. (optional)
     - parameter person: (query) Optional. If specified, results will be filtered to include only those containing the specified person. (optional)
     - parameter personIds: (query) Optional. If specified, results will be filtered to include only those containing the specified person ids. (optional)
     - parameter personTypes: (query) Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. (optional)
     - parameter studios: (query) Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. (optional)
     - parameter studioIds: (query) Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. (optional)
     - parameter userId: (query) User id. (optional)
     - parameter nameStartsWithOrGreater: (query) Optional filter by items whose name is sorted equally or greater than a given input string. (optional)
     - parameter nameStartsWith: (query) Optional filter by items whose name is sorted equally than a given input string. (optional)
     - parameter nameLessThan: (query) Optional filter by items whose name is equally or lesser than a given input string. (optional)
     - parameter enableImages: (query) Optional, include image information in output. (optional, default to true)
     - parameter enableTotalRecordCount: (query) Total record count. (optional, default to true)
     - returns: RequestBuilder<BaseItemDtoQueryResult> 
     */
    open class func getArtistsWithRequestBuilder(minCommunityRating: Double? = nil, startIndex: Int? = nil, limit: Int? = nil, searchTerm: String? = nil, parentId: UUID? = nil, fields: [ItemFields]? = nil, excludeItemTypes: [String]? = nil, includeItemTypes: [String]? = nil, filters: [ItemFilter]? = nil, isFavorite: Bool? = nil, mediaTypes: [String]? = nil, genres: [String]? = nil, genreIds: [UUID]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int]? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, person: String? = nil, personIds: [UUID]? = nil, personTypes: [String]? = nil, studios: [String]? = nil, studioIds: [UUID]? = nil, userId: UUID? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, enableImages: Bool? = nil, enableTotalRecordCount: Bool? = nil) -> RequestBuilder<BaseItemDtoQueryResult> {
        let path = "/Artists"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String: Any]? = nil

        var urlComponents = URLComponents(string: URLString)
        urlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "minCommunityRating": minCommunityRating?.encodeToJSON(),
            "startIndex": startIndex?.encodeToJSON(),
            "limit": limit?.encodeToJSON(),
            "searchTerm": searchTerm?.encodeToJSON(),
            "parentId": parentId?.encodeToJSON(),
            "fields": fields?.encodeToJSON(),
            "excludeItemTypes": excludeItemTypes?.encodeToJSON(),
            "includeItemTypes": includeItemTypes?.encodeToJSON(),
            "filters": filters?.encodeToJSON(),
            "isFavorite": isFavorite?.encodeToJSON(),
            "mediaTypes": mediaTypes?.encodeToJSON(),
            "genres": genres?.encodeToJSON(),
            "genreIds": genreIds?.encodeToJSON(),
            "officialRatings": officialRatings?.encodeToJSON(),
            "tags": tags?.encodeToJSON(),
            "years": years?.encodeToJSON(),
            "enableUserData": enableUserData?.encodeToJSON(),
            "imageTypeLimit": imageTypeLimit?.encodeToJSON(),
            "enableImageTypes": enableImageTypes?.encodeToJSON(),
            "person": person?.encodeToJSON(),
            "personIds": personIds?.encodeToJSON(),
            "personTypes": personTypes?.encodeToJSON(),
            "studios": studios?.encodeToJSON(),
            "studioIds": studioIds?.encodeToJSON(),
            "userId": userId?.encodeToJSON(),
            "nameStartsWithOrGreater": nameStartsWithOrGreater?.encodeToJSON(),
            "nameStartsWith": nameStartsWith?.encodeToJSON(),
            "nameLessThan": nameLessThan?.encodeToJSON(),
            "enableImages": enableImages?.encodeToJSON(),
            "enableTotalRecordCount": enableTotalRecordCount?.encodeToJSON(),
        ])

        let nillableHeaders: [String: Any?] = [
            :
        ]

        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<BaseItemDtoQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (urlComponents?.string ?? URLString), parameters: parameters, headers: headerParameters)
    }

}
