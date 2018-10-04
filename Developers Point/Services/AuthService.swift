//
//  AuthService.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 04/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, completion: @escaping userCreationCompleteHandler) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            guard let user = user else {
                completion(false, error)
                return
            }
            
            // This will Create the User
            let userData = ["provider": user.user.providerID, "email": user.user.email]
            DataService.instance.createDBUSer(uid: user.user.uid, userData: userData as Dictionary<String, Any>)
            completion(true, nil)
        }
        
        
    }
    
    func loginUser(withEmail email: String, andPassword password: String, completion: @escaping loginCompleteHandler) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                completion(false, error)
                return
            }
            completion(true, nil)
        }
        
        
    }
    
    
}
