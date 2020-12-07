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
    var tweet: Tweet { get }
    var favorites: Favorites { get }
    var authorName: String { get }
    var authorHandle: String { get }
    var authorProfilePhoto: UIImage? { get }
    var content: String { get }
    var timeElapsedString: String { get }
    var dateString: String { get }
    var isFavorite: Bool { get }
}

class TweetDetailVM: TweetDetailVMContract {
    
    // MARK: Properties
    
    var tweet: Tweet
    var favorites: Favorites
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
    
    var isFavorite: Bool {
        return favorites.isFavorite(id: tweet.id)
    }
    
    // MARK: Init
    
    init(tweet: Tweet, favorites: Favorites) {
        self.tweet = tweet
        self.favorites = favorites
    }
}
