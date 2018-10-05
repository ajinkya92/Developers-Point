//
//  AuthVC.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 04/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
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
