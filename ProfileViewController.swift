//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Simona Virga on 2/20/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetsCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        getProfileInformation()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getProfileInformation()
    {
        
        APIManager.shared.getCurrentAccount(completion: {(user, error) in
            if let error = error
            {
                print(error.localizedDescription)
            }
            else if let user = user
            {
                self.usernameLabel.text = user.screenname
                self.nameLabel.text = user.name
                self.tweetsCountLabel.text = "\(user.tweetCount ?? 0)"
                self.followersCountLabel.text = "\(user.followerCount ?? 0)"
                self.followingCountLabel.text = "\(user.followingCount ?? 0)"
                self.profileImageView.af_setImage(withURL: URL(string: user.profileImageURL)!)
               
            }
        })
        
    }
    
    
}
