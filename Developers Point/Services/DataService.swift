//
//  DataService.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 04/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_Groups = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_Groups
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    
    func createDBUSer(uid: String, userData: Dictionary<String, Any>) {
        
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    
}
