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
    /// Issues a command to a client to display a message to the user.
    static public func sendMessageCommand(sessionID: String, _ body: JellyfinAPI.MessageCommand) -> Request<Void> {
        Request(method: "POST", url: "/Sessions/\(sessionID)/Message", body: body, id: "SendMessageCommand")
    }
}
