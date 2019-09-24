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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImage.layer.cornerRadius = 5.0
        thumbnailImage.clipsToBounds = true
    }
    
    func configure(with tweet: Tweet) {
        nameLabel.text = tweet.author.name
        handleLabel.text = tweet.author.handle
        contentLabel.text = tweet.text
        timeElapsedLabel.text = Date.timeElapsedString(since: tweet.createdAt)
        
        if
            let profileImageUrl = tweet.author.profileImageUrl,
            let imageData = try? Data(contentsOf: profileImageUrl) {
            thumbnailImage.image = UIImage(data: imageData)
        } else {
            thumbnailImage.image = nil
        }
    }
}
