//
//  FeedCell.swift
//  TweetMD
//
//  Created by Kimberly Hsiao on 1/22/19.
//  Copyright © 2019 Doximity. All rights reserved.
//

import Foundation
import UIKit

class FeedCell: UITableViewCell {
    static var reuseIdentifier: String {
        return "FeedCell"
    }
    
    @IBOutlet private var thumbnailImage: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var handleLabel: UILabel!
    @IBOutlet private var contentLabel: UILabel!
    @IBOutlet private var timeElapsedLabel: UILabel!
    
    // This was interesting. In this case I needed a decent chunk of logic to handle finding the user handles in a string so I was going to create a view model, however I also figured this logic might be handy in other areas of the app (in the future), so I decided to just create a logic controller that's a bit less tied to the view itself and more shareable throughout the app.
    let tweetLogicController = TweetLC()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImage.layer.cornerRadius = 5.0
        thumbnailImage.clipsToBounds = true
        
        setupColors()
    }
    
    func configure(with tweet: Tweet) {
        nameLabel.text = tweet.author.name
        handleLabel.text = tweet.author.handle
        contentLabel.attributedText = tweetLogicController.buildAttributedContentString(text: tweet.text)
        timeElapsedLabel.text = Date.timeElapsedString(since: tweet.createdAt)
        
        if
            let profileImageUrl = tweet.author.profileImageUrl,
            let imageData = try? Data(contentsOf: profileImageUrl) {
            thumbnailImage.image = UIImage(data: imageData)
        } else {
            thumbnailImage.image = nil
        }
    }
    
    func setupColors() {
        nameLabel.textColor = .foregroundPrimary
        handleLabel.textColor = .foregroundSecondary
        timeElapsedLabel.textColor = .foregroundSecondary
        contentLabel.textColor = .foregroundPrimary
    }
}
