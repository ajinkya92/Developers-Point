//
//  CreatePostVC.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 05/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        sendButton.bindToKeyboard()
        
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        
        if textView.text != nil && textView.text != "Say Something here..." {
            sendButton.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: textView.text, forUid: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
                
                if isComplete {
                    self.sendButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendButton.isEnabled = true
                    print("There was an error!")
                }
                
               
            }
            
        }
        
    }
    

}

extension CreatePostVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
