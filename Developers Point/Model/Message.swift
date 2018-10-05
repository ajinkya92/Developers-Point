//
//  Message.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 05/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

class Message {
    
    private var _context: String
    private var _senderId: String
    
    var content: String {
        return _context
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._context = content
        self._senderId = senderId
    }
}
