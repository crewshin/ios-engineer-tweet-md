//
//  TweetLC.swift
//  TweetMD
//
//  Created by Gene Crucean on 12/5/20.
//  Copyright © 2020 Doximity. All rights reserved.
//

import UIKit

struct TweetLC {
    func buildAttributedContentString(text: String) -> NSMutableAttributedString {
        let outputString = NSMutableAttributedString(string: text)
        
        if let handleRanges = findRangesForHandlesInTweet(text: text) {
            for range in handleRanges {
                outputString.addAttributes([.foregroundColor: UIColor.foregroundRetweetedUser], range: range)
            }
        }
        
        return outputString
    }
    
    func findRangesForHandlesInTweet(text: String) -> [NSRange]? {
        do {
            let regex = try NSRegularExpression(pattern: "(^|[^@\\w])@(\\w{1,25})\\b")
            let results = regex.matches(in: text, options: [], range: NSMakeRange(0, text.count))
            
            if results.count == 0 {
                return nil
            }
            
            var outputResults: [NSRange] = []
            for result in results {
                outputResults.append(result.range)
            }
            
            return outputResults
        } catch {
            return nil
        }
    }
}
