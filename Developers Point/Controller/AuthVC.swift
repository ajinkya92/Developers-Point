//
//  AuthVC.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 04/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // It there is a User it should dismiss and logout when the user has signed out
        
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func signinWithEmailButtonTapped(_ sender: UIButton) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        
        self.present(loginVC, animated: true, completion: nil)
    }
    
    @IBAction func signinWithGoogleButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func signinWithFacebookButtonTapped(_ sender: UIButton) {
    }
    
    
    
}
