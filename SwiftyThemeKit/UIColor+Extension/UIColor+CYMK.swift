//
//  UIColor+CYMK.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/14.
//  Copyright © 2018年 Octree. All rights reserved.
//

import Foundation

///  支持 CYMK 颜色模型
public extension UIColor {
    /// 获取 CMYL 颜色值， 区间 [0, 1]
    var cmyk: (CGFloat, CGFloat, CGFloat, CGFloat) {
        let (r, g, b) = rgbComponents
        
        if (r == 0 && g == 0 && b == 0) {
            return (0, 0, 0, 1)
        }
        
        var c = 1 - r
        var m = 1 - g
        var y = 1 - b
        
        let minCMY = min(c, m, y)
        c = (c - minCMY) / (1 - minCMY)
        m = (m - minCMY) / (1 - minCMY)
        y = (y - minCMY) / (1 - minCMY)
        let k = minCMY
        return (c, m, y, k)
    }

    
    /// 根据 CYMK 的值初始化 UIColor
    /// CYMK 的区间 [0, 1]
    ///
    /// - Parameters:
    ///   - cyan: cyan
    ///   - magenta: magenta
    ///   - yellow: yello
    ///   - key: key
    convenience init(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key: CGFloat) {
        let c = cyan * (1 - key) + key
        let m = magenta * (1 - key) + key
        let y = yellow * (1 - key) + key
        
        let r = 1 - c
        let g = 1 - m
        let b = 1 - y
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
