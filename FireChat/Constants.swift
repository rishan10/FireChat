//
//  Constants.swift
//  FireChat
//
//  Created by Rishan Girish on 9/8/17.
//  Copyright © 2017 Rishan Girish. All rights reserved.
//

import Foundation
import Firebase

struct Constants {
    struct refs {
        static let databaseRoot = FIRDatabase.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
