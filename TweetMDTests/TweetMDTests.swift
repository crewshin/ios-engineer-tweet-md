//
//  TweetMDTests.swift
//  TweetMDTests
//
//  Created by Kimberly Hsiao on 1/11/19.
//  Copyright © 2019 Doximity. All rights reserved.
//  Documentation on Quick/Nimble: https://github.com/Quick/Nimble
//

import Foundation
import Quick
import Nimble

@testable import TweetMD

class TweetMDTests: QuickSpec {
    
    override func spec() {
        
        it("passes this test") {
            expect(true).to(beTrue())
        }
        
        it("passes this math test") {
            expect(1+1).to(equal(2))
        }
        
    }
}
