//
//  TweetDetailVM.swift
//  TweetMD
//
//  Created by Kimberly Hsiao on 1/24/19.
//  Copyright © 2019 Doximity. All rights reserved.
//

import Foundation
import UIKit

protocol TweetDetailVMContract {
    var authorName: String { get }
    var authorHandle: String { get }
    var authorProfilePhoto: UIImage? { get }
    var content: String { get }
    var timeElapsedString: String { get }
    var dateString: String { get }
}

class TweetDetailVM: TweetDetailVMContract {
    
    // MARK: Properties
    let tweet: Tweet
    
    var authorName: String { return tweet.author.name }
    var authorHandle: String { return tweet.author.handle }
    var content: String { return tweet.text }
    
    var authorProfilePhoto: UIImage? {
        guard
            let imageUrl = tweet.author.profileImageUrl,
            let imageData = try? Data(contentsOf: imageUrl)
            else { return nil }
        
        return UIImage(data: imageData)
    }
    
    var timeElapsedString: String {
       return Date.timeElapsedString(since: tweet.createdAt)
    }
    
    var dateString: String {
        return tweet.createdAt.fullDateString()
    }

    
    // MARK: Init
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    
}
