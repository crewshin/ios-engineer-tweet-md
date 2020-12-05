//
//  FeedCellLCTests.swift
//  TweetMDTests
//
//  Created by Gene Crucean on 12/5/20.
//  Copyright © 2020 Doximity. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TweetMD

class FeedCellLCTests: QuickSpec {
    
    let sut = TweetLC()
    
    override func spec() {
        it("passes the correct number of handles found in text") {
            let ranges = self.sut.findRangesForHandlesInTweet(text: "@isoldmysoul69 @Insomnia130613 @kbeat_lvl @OH_mes2 @BTS_twt I love seeing Kpoppies cry. It’s my daily medicine, my… https://t.co/nw9UJya9Ak")
            expect(ranges?.count).to(equal(5))
        }
    }
}
