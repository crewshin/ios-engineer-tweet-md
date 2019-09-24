//
//  Tweet.swift
//  TweetMD
//
//  Created by Kimberly Hsiao on 1/18/19.
//  Copyright © 2019 Doximity. All rights reserved.
//

import Foundation

struct TweetsContainer: Decodable {
    let tweets: [Tweet]
    
    enum CodingKeys: String, CodingKey {
        case tweets = "statuses"
    }
}

struct Tweet: Decodable {
    let id: Int
    let text: String
    let userMentions: [UserMention] = []
    let author: User
    let createdAtString: String
    
    var createdAt: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE MMM d HH:mm:ss Z yyyy"
        return dateFormatter.date(from: createdAtString) ?? Date()
    }

    enum CodingKeys: String, CodingKey {
        case id
        case text
        case author = "user"
        case createdAtString = "created_at"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        text = try container.decode(String.self, forKey: .text)
        author = try container.decode(User.self, forKey: .author)
        createdAtString = try container.decode(String.self, forKey: .createdAtString)
    }
}
