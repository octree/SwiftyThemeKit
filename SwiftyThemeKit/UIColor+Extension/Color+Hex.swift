//
//  Color+Hex.swift
//  Color+Hex
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//


import UIKit


public extension UIColor {
    
    convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
 
    convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var hex = hexString
        if hex.hasPrefix("#") {
            hex = String(hex[hex.index(after: hex.startIndex)...])
        }
        
        guard let hexVal = Int(hex, radix: 16) else {
            self.init()
            return nil
        }
        
        if hex.count == 6 {
            self.init(hex6: UInt32(hexVal), alpha: alpha)
        } else {
            return nil
        }
    }
}
