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
        it("passes the correct number of handles found in text (5)") {
            let ranges = self.sut.findRangesForHandlesInTweet(text: "@isoldmysoul69 @Insomnia130613 @kbeat_lvl @OH_mes2 @BTS_twt I love seeing Kpoppies cry. It’s my daily medicine, my… https://t.co/nw9UJya9Ak")
            expect(ranges?.count).to(equal(5))
        }
        
        it("passes the correct number of handles found in text (1)") {
            let ranges = self.sut.findRangesForHandlesInTweet(text: "RT @dremilyportermd: A physician colleague\'s insurance will not cover her anti-nausea medicine (Zofran/ondansetron) for her CHEMO. It is $2…")
            expect(ranges?.count).to(equal(1))
        }
        
        it("passes the correct number of handles found in text (nil)") {
            let ranges = self.sut.findRangesForHandlesInTweet(text: "Am not sure who needs to hear this but food supplements are not medicine,they just help with boosting your immunity… https://t.co/7hZusQ7gpp")
            expect(ranges?.count).to(beNil())
        }
    }
}
