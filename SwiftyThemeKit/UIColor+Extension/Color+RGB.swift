//
//  Color+RGB.swift
//  Color+RGB
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//


import UIKit

public extension UIColor {
    
    var rgbComponents: (CGFloat, CGFloat, CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: nil)
        return (r, g, b)
    }
}
