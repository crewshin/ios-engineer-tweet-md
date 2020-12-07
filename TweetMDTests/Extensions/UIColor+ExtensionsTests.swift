//
//  UIColor+ExtensionsTests.swift
//  TweetMDTests
//
//  Created by Gene Crucean on 12/5/20.
//  Copyright © 2020 Doximity. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TweetMD

class UIColor_ExtensionsTests: QuickSpec {

    override func spec() {
        it("will return a proper UIColor") {
            expect(UIColor(hex: "FF0000")).toNot(beNil())
        }
    }
}
