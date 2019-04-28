//
//  Color+Scheme.swift
//  Color+Scheme
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//


import UIKit


///  根据不同的配色技巧生成不同的配色方案
///  包含了常用的配色技巧，比如互补色、互补色拆分、相近色等
///  共包含 18 中常用的配色技巧
public extension UIColor {
    
    func scheme(from degrees: [CGFloat]) -> [UIColor] {
        let (h, s, v, a) = hsva
        return degrees.map {
            return UIColor(hue: (h + $0).truncatingRemainder(dividingBy: 1),
                           saturation: s,
                           brightness: v,
                           alpha:a)
        }
    }
    
    //    互补色
    var complementaryScheme: [UIColor] {
        return scheme(from: [0, 0.5])
    }
    
    var splitComplementaryScheme: [UIColor] {
        return scheme(from: [0, CGFloat(150.0 / 360), CGFloat(320.0 / 360) ])
    }
    
    var splitComplementaryCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(150.0 / 360), CGFloat(300.0 / 360) ])
    }
    
    var splitComplementaryCCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(60.0 / 360), CGFloat(210.0 / 360) ])
    }
    //    三分
    var triadicScheme: [UIColor] {
        return scheme(from: [0, CGFloat(120.0 / 360), CGFloat(240.0 / 360) ])
    }
    //
    var clashScheme: [UIColor] {
        return scheme(from: [0, CGFloat(90.0 / 360), CGFloat(270.0 / 360) ])
    }
    //    四个相反色
    var tetradicScheme: [UIColor] {
        return scheme(from: [0, CGFloat(90.0 / 360), CGFloat(180.0 / 360),  CGFloat(270.0 / 360)])
    }
    
    var fourToneCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(60.0 / 360), CGFloat(180.0 / 360),  CGFloat(240.0 / 360)])
    }
    
    var fourToneCCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(120.0 / 360), CGFloat(180.0 / 360),  CGFloat(300.0 / 360)])
    }
    
    var fiveToneAScheme: [UIColor] {
        return scheme(from: [0, CGFloat(115.0 / 360), CGFloat(155.0 / 360),  CGFloat(205.0 / 360), CGFloat(245.0 / 360)])
    }
    
    var fiveToneBScheme: [UIColor] {
        return scheme(from: [0, CGFloat(40.0 / 360), CGFloat(90.0 / 360),  CGFloat(130.0 / 360), CGFloat(245.0 / 360)])
    }
    
    var fiveToneCScheme: [UIColor] {
        return scheme(from: [0, CGFloat(50.0 / 360), CGFloat(90.0 / 360),  CGFloat(205.0 / 360), CGFloat(320.0 / 360)])
    }
    
    var fiveToneDScheme: [UIColor] {
        return scheme(from: [0, CGFloat(40.0 / 360), CGFloat(155.0 / 360),  CGFloat(270.0 / 360), CGFloat(310.0 / 360)])
    }
    
    var fiveToneEScheme: [UIColor] {
        return scheme(from: [0, CGFloat(115.0 / 360), CGFloat(230.0 / 360),  CGFloat(270.0 / 360), CGFloat(320.0 / 360)])
    }
    
    var sixToneCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(30.0 / 360), CGFloat(120.0 / 360),  CGFloat(150.0 / 360), CGFloat(240.0 / 360), CGFloat(270.0 / 360)])
    }
    
    var sixToneCCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(90.0 / 360), CGFloat(120.0 / 360),  CGFloat(210.0 / 360), CGFloat(240.0 / 360), CGFloat(330.0 / 360)])
    }
    
    var neutralScheme: [UIColor] {
        return scheme(from: [0, CGFloat(15.0 / 360), CGFloat(30.0 / 360),  CGFloat(45.0 / 360), CGFloat(60.0 / 360), CGFloat(75.0 / 360)])
    }
    
    var analogousScheme: [UIColor] {
        return scheme(from: [0, CGFloat(30.0 / 360), CGFloat(60.0 / 360),  CGFloat(90.0 / 360), CGFloat(120.0 / 360), CGFloat(150.0 / 360)])
    }
    
}
