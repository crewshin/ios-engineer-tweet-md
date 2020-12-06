//
//  UIColor+Extensions.swift
//  TweetMD
//
//  Created by Kimberly Hsiao on 1/24/19.
//  Copyright © 2019 Doximity. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static var foregroundPrimary: UIColor {
        return UIColor(hex: "000000")
    }
    
    static var foregroundSecondary: UIColor {
        return UIColor(hex: "9B9B9B")
    }
    
    static var foregroundRetweetedUser: UIColor {
        return UIColor(hex: "6191C5")
    }

    /// Usage: UIColor(hex: "385C37")
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        assert(cString.count == 6, "String needs 6 characters as input")
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
}

