//
//  Date+ExtensionsTests.swift
//  TweetMDTests
//
//  Created by Gene Crucean on 12/6/20.
//  Copyright © 2020 Doximity. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TweetMD

class Date_ExtensionsTests: QuickSpec {

    override func spec() {
        it("will display just now") {
            let now = Date()
            expect(Date.timeElapsedString(since: now)).to(equal("just now"))
        }
        
        it("will display 2m") {
            let twoMinAgo = Date().addingTimeInterval((2 * 60) / -1)
            expect(Date.timeElapsedString(since: twoMinAgo)).to(equal("2m"))
        }
        
        it("will display 3h") {
            let threeHoursAgo = Date().addingTimeInterval((3 * 60 * 60) / -1)
            expect(Date.timeElapsedString(since: threeHoursAgo)).to(equal("3h"))
        }
        
        it("will display 5d") {
            let fiveDaysAgo = Date().addingTimeInterval((5 * 60 * 60 * 24) / -1)
            expect(Date.timeElapsedString(since: fiveDaysAgo)).to(equal("5d"))
        }
        
        it("will display correctly for greater than 7 days") {
            let timeToSubtract: Double = (10 * 60 * 60 * 24) / -1
            let tenDaysAgo = Date().addingTimeInterval(timeToSubtract)
            let formatter = DateFormatter()
            formatter.dateFormat = "M/d/yy"
            expect(Date.timeElapsedString(since: tenDaysAgo)).to(equal(formatter.string(from: tenDaysAgo)))
        }
    }
}
