//
//  TweetDetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Simona Virga on 2/18/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController
{

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setupTweet()
        retweetCount()
        favoriteCount()
        rtButton()
        favButton()
       
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupTweet()
    {
        if let tweet = tweet
        {
            tweetLabel.text = tweet.text
            
            retweetLabel.text = "retweets"
            favoriteLabel.text = "likes"
            
        
            nameLabel.text = tweet.user.name
            usernameLabel.text = tweet.user.screenname
            timestampLabel.text = tweet.createdAtString
            
            profileImageView.af_setImage(withURL: URL(string: tweet.profilePictureString)!)
            profileImageView.layer.cornerRadius = 4
            profileImageView.clipsToBounds = true
        }
    }
    

    func updateButton(button: UIButton, selected: Bool?)
    {
        if let selected = selected {
            button.isSelected = selected
        }
    }
    
    func rtButton()
    {
        if tweet.retweeted
        {
            retweetButton.isSelected = true
        } else {
            retweetButton.isSelected = false
        }
    }
    
    func favButton()
    {
        if tweet.favorited!
        {
            favoriteButton.isSelected = true
        } else {
            favoriteButton.isSelected = false
        }
    }
    
    func favoriteCount()
    {
        favoriteCountLabel.isHidden = (tweet.favoriteCount == 0)
        favoriteLabel.isHidden = (tweet.favoriteCount == 0)
        favoriteCountLabel.text = "\(tweet.favoriteCount)"
    }
    
    func retweetCount() {
        retweetCountLabel.isHidden = (tweet.retweetCount == 0)
        retweetLabel.isHidden = (tweet.retweetCount == 0)
        retweetCountLabel.text = "\(tweet.retweetCount)"
    }
    

}
