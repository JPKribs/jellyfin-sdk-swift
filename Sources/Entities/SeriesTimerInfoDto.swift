//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SeriesTimerInfoDto.
public struct SeriesTimerInfoDto: Codable, Identifiable {
    /// Gets or sets the channel id of the recording.
    public var channelID: UUID?
    /// Gets or sets the channel name of the recording.
    public var channelName: String?
    public var channelPrimaryImageTag: String?
    /// Gets or sets the day pattern.
    public var dayPattern: DayPattern?
    /// Gets or sets the days.
    public var days: [DayOfWeek]?
    /// Gets or sets the end date of the recording, in UTC.
    public var endDate: Date?
    /// Gets or sets the external channel identifier.
    public var externalChannelID: String?
    /// Gets or sets the external identifier.
    public var externalID: String?
    /// Gets or sets the external program identifier.
    public var externalProgramID: String?
    /// Gets or sets the Id of the recording.
    public var id: String?
    /// Gets or sets the image tags.
    public var imageTags: [String: String]?
    /// Gets or sets a value indicating whether this instance is post padding required.
    public var isPostPaddingRequired: Bool?
    /// Gets or sets a value indicating whether this instance is pre padding required.
    public var isPrePaddingRequired: Bool?
    public var keepUntil: KeepUntil?
    public var keepUpTo: Int32?
    /// Gets or sets the name of the recording.
    public var name: String?
    /// Gets or sets the description of the recording.
    public var overview: String?
    /// Gets or sets the parent backdrop image tags.
    public var parentBackdropImageTags: [String]?
    /// Gets or sets the Id of the Parent that has a backdrop if the item does not have one.
    public var parentBackdropItemID: String?
    /// Gets or sets the parent primary image item identifier.
    public var parentPrimaryImageItemID: String?
    /// Gets or sets the parent primary image tag.
    public var parentPrimaryImageTag: String?
    /// Gets or sets the parent thumb image tag.
    public var parentThumbImageTag: String?
    /// Gets or sets the parent thumb item id.
    public var parentThumbItemID: String?
    /// Gets or sets the post padding seconds.
    public var postPaddingSeconds: Int32?
    /// Gets or sets the pre padding seconds.
    public var prePaddingSeconds: Int32?
    /// Gets or sets the priority.
    public var priority: Int32?
    /// Gets or sets the program identifier.
    public var programID: String?
    /// Gets or sets a value indicating whether [record any channel].
    public var isRecordAnyChannel: Bool?
    /// Gets or sets a value indicating whether [record any time].
    public var isRecordAnyTime: Bool?
    /// Gets or sets a value indicating whether [record new only].
    public var isRecordNewOnly: Bool?
    /// Gets or sets the server identifier.
    public var serverID: String?
    /// Gets or sets the name of the service.
    public var serviceName: String?
    public var isSkipEpisodesInLibrary: Bool?
    /// Gets or sets the start date of the recording, in UTC.
    public var startDate: Date?
    public var type: String?

    public init(channelID: UUID? = nil, channelName: String? = nil, channelPrimaryImageTag: String? = nil, dayPattern: DayPattern? = nil, days: [DayOfWeek]? = nil, endDate: Date? = nil, externalChannelID: String? = nil, externalID: String? = nil, externalProgramID: String? = nil, id: String? = nil, imageTags: [String: String]? = nil, isPostPaddingRequired: Bool? = nil, isPrePaddingRequired: Bool? = nil, keepUntil: KeepUntil? = nil, keepUpTo: Int32? = nil, name: String? = nil, overview: String? = nil, parentBackdropImageTags: [String]? = nil, parentBackdropItemID: String? = nil, parentPrimaryImageItemID: String? = nil, parentPrimaryImageTag: String? = nil, parentThumbImageTag: String? = nil, parentThumbItemID: String? = nil, postPaddingSeconds: Int32? = nil, prePaddingSeconds: Int32? = nil, priority: Int32? = nil, programID: String? = nil, isRecordAnyChannel: Bool? = nil, isRecordAnyTime: Bool? = nil, isRecordNewOnly: Bool? = nil, serverID: String? = nil, serviceName: String? = nil, isSkipEpisodesInLibrary: Bool? = nil, startDate: Date? = nil, type: String? = nil) {
        self.channelID = channelID
        self.channelName = channelName
        self.channelPrimaryImageTag = channelPrimaryImageTag
        self.dayPattern = dayPattern
        self.days = days
        self.endDate = endDate
        self.externalChannelID = externalChannelID
        self.externalID = externalID
        self.externalProgramID = externalProgramID
        self.id = id
        self.imageTags = imageTags
        self.isPostPaddingRequired = isPostPaddingRequired
        self.isPrePaddingRequired = isPrePaddingRequired
        self.keepUntil = keepUntil
        self.keepUpTo = keepUpTo
        self.name = name
        self.overview = overview
        self.parentBackdropImageTags = parentBackdropImageTags
        self.parentBackdropItemID = parentBackdropItemID
        self.parentPrimaryImageItemID = parentPrimaryImageItemID
        self.parentPrimaryImageTag = parentPrimaryImageTag
        self.parentThumbImageTag = parentThumbImageTag
        self.parentThumbItemID = parentThumbItemID
        self.postPaddingSeconds = postPaddingSeconds
        self.prePaddingSeconds = prePaddingSeconds
        self.priority = priority
        self.programID = programID
        self.isRecordAnyChannel = isRecordAnyChannel
        self.isRecordAnyTime = isRecordAnyTime
        self.isRecordNewOnly = isRecordNewOnly
        self.serverID = serverID
        self.serviceName = serviceName
        self.isSkipEpisodesInLibrary = isSkipEpisodesInLibrary
        self.startDate = startDate
        self.type = type
    }
}
