//
//  FeedCell.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 05/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailTextLabel: UILabel!
    @IBOutlet weak var contextLabel: UILabel!
    
    
    func configureCell(profileImage: UIImage, email: String, context: String) {
        
        self.profileImage.image = profileImage
        self.emailTextLabel.text = email
        self.contextLabel.text = context
        
    }
}
