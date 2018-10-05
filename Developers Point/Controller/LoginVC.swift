//
//  LoginVC.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 04/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        if emailTextField.text != nil && passwordTextField.text != nil {
            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, loginError) in
                
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(loginError?.localizedDescription ?? "")
                }
                // If the user has never logged in then there will be an error and hence moving to register user to create an account
                AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, completion: { (success, registrationError) in
                    
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, completion: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully Registered the User")
                        })
                    } else {
                        print(registrationError?.localizedDescription ?? "")
                    }
                    
                })
            }
        }
        
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    
}
