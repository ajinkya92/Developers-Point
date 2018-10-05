//
//  FirstViewController.swift
//  Developers Point
//
//  Created by Ajinkya Sonar on 04/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllMessages { (returnedMessagesArray) in
            
            self.messageArray = returnedMessagesArray.reversed() //This reverses the recent post on the top
            self.tableView.reloadData()
        }
    }

    @IBAction func composeFeedButtonTapped(_ sender: UIButton) {
        let createPostVC = storyboard?.instantiateViewController(withIdentifier: "CreatePostVC") as! CreatePostVC
        self.present(createPostVC, animated: true, completion: nil)
    }
    
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else {return UITableViewCell()}
        
        let image = UIImage(named: "defaultProfileImage")
        
        let message = messageArray[indexPath.row]
        
        DataService.instance.getUsername(forUid: message.senderId) { (returnedUsername) in
            
            cell.configureCell(profileImage: image!, email: returnedUsername, context: message.content)
        }
        
        return cell
        
    }
    
}
