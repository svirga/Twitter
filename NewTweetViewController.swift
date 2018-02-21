//
//  NewTweetViewController.swift
//  twitter_alamofire_demo
//
//  Created by Simona Virga on 2/18/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController, UITextViewDelegate
{

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    var replying: Bool = false
    var replyId: String?
    var newPlaceholder: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        tweetTextView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func didTapTweet(_ sender: Any) {
        
       
        
        if !replying {
            APIManager.shared.composeTweet(with: tweetTextView.text) { (tweet, error) in
                if let error = error {
                    print("Error composing Tweet: \(error.localizedDescription)")
                    self.dismiss(animated: true, completion: nil)
                } else if let tweet = tweet {
                    //print("Compose Tweet Success!")
                    self.dismiss(animated: true, completion: nil)
                }
            }
        } else if let id = replyId {
            
            APIManager.shared.reply(id: id, text: tweetTextView.text, completion: {(tweet, error) in
                if let error = error {
                    print("Error replying to Tweet: \(error.localizedDescription)")
                    self.dismiss(animated: true, completion: nil)
                } else if tweet != nil {
                    self.dismiss(animated: true, completion: nil)
                    print("Reply to tweet successful")
                }
            })
            
            replying = false
            replyId = nil
            newPlaceholder = nil
        }
        
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = tweetTextView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        characterCountLabel.text = String(Int(140 - updatedText.count))
        
        updateCharacterCountLabel(count: 140 - updatedText.count)
        
        return updatedText.count < 140
    }
    
    func updateCharacterCountLabel(count: Int) {
        
        switch count {
        case 0:
            characterCountLabel.textColor = .red
        case 10:
            characterCountLabel.textColor = #colorLiteral(red: 0.9159221343, green: 0.1873795243, blue: 0.09282759355, alpha: 1)
        case 20:
            characterCountLabel.textColor = #colorLiteral(red: 0.8571895836, green: 0.1753640079, blue: 0.08687512101, alpha: 1)
        case 30:
            characterCountLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        case 50:
            characterCountLabel.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        case 80:
            characterCountLabel.textColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        default:
            characterCountLabel.textColor = .black
        }
        
        characterCountLabel.textColor = (count == 0) ? .red : .black
        characterCountLabel.textColor = (count < 80) ? #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1) : .black
        characterCountLabel.textColor = (count < 50) ? #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1) : .black
        characterCountLabel.textColor = (count < 30) ? #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) : .black
        characterCountLabel.textColor = (count < 20) ? #colorLiteral(red: 0.8571895836, green: 0.1753640079, blue: 0.08687512101, alpha: 1) : .black
        characterCountLabel.textColor = (count < 10) ? #colorLiteral(red: 0.9159221343, green: 0.1873795243, blue: 0.09282759355, alpha: 1) : .black
    }


}
