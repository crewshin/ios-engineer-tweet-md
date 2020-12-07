//
//  User.swift
//  TweetMD
//
//  Created by Kimberly Hsiao on 1/23/19.
//  Copyright © 2019 Doximity. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let handle: String
    let profileImageUrlString: String
    
    var profileImageUrl: URL? {
        return URL(string: profileImageUrlString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case handle = "screen_name"
        case profileImageUrlString = "profile_image_url_https"
    }
}

struct UserMention: Decodable {
    let id: Int
    let screenName: String
    let name: String
    let idStr: String
    let indices: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case screenName = "screen_name"
        case name
        case idStr = "id_str"
        case indices
    }
}

struct Entities: Decodable {
    let userMentions: [UserMention]

    enum CodingKeys: String, CodingKey {
        case userMentions = "user_mentions"
    }
}
