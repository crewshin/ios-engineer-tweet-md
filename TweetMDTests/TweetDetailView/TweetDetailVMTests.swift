//
//  TweetDetailVMTests.swift
//  TweetMDTests
//
//  Created by Gene Crucean on 12/7/20.
//  Copyright © 2020 Doximity. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TweetMD

class TweetDetailVMTests: QuickSpec {

    override func spec() {
        
        var tweet = decodeTweet(createdAt: oneDayAgoTime())
        var favorites = Favorites()
        var sut = TweetDetailVM(tweet: tweet, favorites: favorites)

        context("timeElapsedString displays correctly") {
            it("shows elapsed time correct") {
                tweet = self.decodeTweet(createdAt: self.oneDayAgoTime())
                favorites = Favorites()
                sut = TweetDetailVM(tweet: tweet, favorites: favorites)
                expect(sut.timeElapsedString).to(equal("1d"))
            }
        }

        context("dateString displays correctly") {
            it("shows date string formatting correctly") {
                tweet = self.decodeTweet(createdAt: self.staticDate())
                favorites = Favorites()
                sut = TweetDetailVM(tweet: tweet, favorites: favorites)
                expect(sut.dateString).to(equal("Monday, Dec 7, 2020 2:27 PM"))
            }
        }
        
        context("dateString displays correctly") {
            it("shows date string formatting correctly") {
                tweet = self.decodeTweet(createdAt: self.staticDate())
                favorites = Favorites()
                sut = TweetDetailVM(tweet: tweet, favorites: favorites)
                expect(sut.dateString).to(equal("Monday, Dec 7, 2020 2:27 PM"))
            }
        }
    }
    
    // MARK: - Helpers
    
    func decodeTweet(createdAt: String) -> Tweet {
        return try! JSONDecoder().decode(Tweet.self, from: Data(stubbedTweet(createdAt: createdAt).utf8))
    }
    
    func oneDayAgoTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE MMM d HH:mm:ss Z yyyy"
        return formatter.string(from: Date().addingTimeInterval((1 * 60 * 60 * 24) / -1))
    }
    
    func staticDate() -> String {
        let date = Date(timeIntervalSince1970: 1607372851)
        let formatter = DateFormatter()
        formatter.dateFormat = "EE MMM d HH:mm:ss Z yyyy"
        return formatter.string(from: date)
    }
    
    func stubbedTweet(createdAt: String) -> String {
        return """
        {
            "created_at": "\(createdAt)",
            "id": 1335628211028365315,
            "text": "RT @NikolovScience: BREAKING: Former Pfizer head of respiratory research Dr. Yeadon and the lung specialist and former head of the public hu2026",
            "entities": {
                "hashtags": [],
                "symbols": [],
                "user_mentions": [{
                    "screen_name": "NikolovScience",
                    "name": "Ned Nikolov, Ph.D.",
                    "id": 884455440293269505,
                    "id_str": "884455440293269505",
                    "indices": [
                        3,
                        18
                    ]
                }],
                "urls": []
            },
            "user": {
                "id": 857103262981525504,
                "id_str": "857103262981525504",
                "name": "ud83dude37sharryud83dude37",
                "screen_name": "Quartz29816132",
                "location": "",
                "description": "",
                "url": null,
                "entities": {
                    "description": {
                        "urls": []
                    }
                },
                "protected": false,
                "followers_count": 94,
                "friends_count": 74,
                "listed_count": 0,
                "created_at": "Wed Apr 26 05:25:16 +0000 2017",
                "favourites_count": 26628,
                "utc_offset": null,
                "time_zone": null,
                "geo_enabled": false,
                "verified": false,
                "statuses_count": 7941,
                "lang": null,
                "contributors_enabled": false,
                "is_translator": false,
                "is_translation_enabled": false,
                "profile_background_color": "F5F8FA",
                "profile_background_image_url": null,
                "profile_background_image_url_https": null,
                "profile_background_tile": false,
                "profile_image_url": "http://pbs.twimg.com/profile_images/1300889270383767555/JKSeQPJD_normal.jpg",
                "profile_image_url_https": "https://pbs.twimg.com/profile_images/1300889270383767555/JKSeQPJD_normal.jpg",
                "profile_banner_url": "https://pbs.twimg.com/profile_banners/857103262981525504/1598991365",
                "profile_link_color": "1DA1F2",
                "profile_sidebar_border_color": "C0DEED",
                "profile_sidebar_fill_color": "DDEEF6",
                "profile_text_color": "333333",
                "profile_use_background_image": true,
                "has_extended_profile": false,
                "default_profile": true,
                "default_profile_image": false,
                "following": null,
                "follow_request_sent": null,
                "notifications": null,
                "translator_type": "none"
            }
        }
        """
    }
}
