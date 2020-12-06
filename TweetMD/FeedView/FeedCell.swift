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
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImage.layer.cornerRadius = 5.0
        thumbnailImage.clipsToBounds = true
        
        setupColors()
    }
    
    // MARK: - Setup
    
    func configure(with tweet: Tweet) {
        nameLabel.text = tweet.author.name
        handleLabel.text = tweet.author.handle
        contentLabel.attributedText = tweetLogicController.buildAttributedContentString(text: tweet.text)
        timeElapsedLabel.text = Date.timeElapsedString(since: tweet.createdAt)
        
        // I would probably set this to a default/loading image of some kind here so it has a starting point.
        thumbnailImage.image = nil
        if let profileImageUrl = tweet.author.profileImageUrl {
            let webProvider = WebProvider()
            webProvider.fetchImageAt(url: profileImageUrl) { (results) in
                switch results {
                case .failure(_):
                    // Fail silently.
                    self.thumbnailImage.image = nil
                case .success(let imageData):
                    let image = UIImage(data: imageData)
                    self.thumbnailImage.image = image
                }
            }
        }
    }
    
    func setupColors() {
        nameLabel.textColor = .foregroundPrimary
        handleLabel.textColor = .foregroundSecondary
        timeElapsedLabel.textColor = .foregroundSecondary
        contentLabel.textColor = .foregroundPrimary
    }
    
    override func prepareForReuse() {
        thumbnailImage.image = nil
    }
}
