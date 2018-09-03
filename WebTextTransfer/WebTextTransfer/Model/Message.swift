//
//  Message.swift
//  WebTextTransfer
//
//  Created by Viktor Siedov on 02.09.2018.
//  Copyright © 2018 Viktor Siedov. All rights reserved.
//

import Foundation
import MessageKit

struct Message: MessageType {
    
    /// message id
    let id: String?
    /// The sender of the message.
    let sender: Sender
    /// The unique identifier for the message.
    let messageId: String
    /// The date the message was sent.
    let sentDate: Date
    /// The kind of message and its underlying kind.
    let kind: MessageKind
    /// message content
    let content: String
}
