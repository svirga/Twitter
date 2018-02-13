//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage


class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var replyIconButton: UIButton!
    @IBOutlet weak var replyIconLabel: UILabel!
    
    @IBOutlet weak var favorIconButton: UIButton!
    @IBOutlet weak var favorIconLabel: UILabel!
    
    @IBOutlet weak var retweetIconButton: UIButton!
    @IBOutlet weak var retweetIconLabel: UILabel!
    
    
    var tweet: Tweet!
    {
        didSet
        {
            tweetTextLabel.text = tweet.text
            nameLabel.text = tweet.user.name
            usernameLabel.text = tweet.user.screenName
            dateLabel.text = tweet.createdAtString
            profilePictureImageView.af_setImage(withURL: tweet.user.userURL!)
            
            retweetIconLabel.text = "\(tweet.favoriteCount ?? 0)"
            
            updateRetweet()
            updateFavorite()
            
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func updateRetweet()
    {
        if tweet.retweeted == true
        {
            retweetIconButton.setBackgroundImage(#imageLiteral(resourceName: "retweet-icon-green"), for: UIControlState.normal)
        }
        else {
            retweetIconButton.setBackgroundImage(#imageLiteral(resourceName: "retweet-icon"), for: UIControlState.normal)
        }
    }
    
    func updateFavorite()
    {
        if tweet.favorited == true
        {
            favorIconButton.setBackgroundImage(#imageLiteral(resourceName: "favor-icon-red"), for: UIControlState.normal)
        }
        else
        {
            favorIconButton.setBackgroundImage(#imageLiteral(resourceName: "favor-icon"), for: UIControlState.normal)
        }
    }
    
    
}
