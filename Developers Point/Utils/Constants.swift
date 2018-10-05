//
//  Constants.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 04/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

typealias userCreationCompleteHandler = (_ status: Bool, _ error: Error?)->()

typealias loginCompleteHandler = (_ status: Bool, _ error: Error?)->()

typealias postSomethingCompleteHandler = (_ status: Bool)-> ()

typealias getAllFeedMessagesCompletionHandler = (_ message: [Message]) -> ()
