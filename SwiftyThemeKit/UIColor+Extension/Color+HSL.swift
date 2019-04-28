//
//  Color+HSL.swift
//  Color+HSL
//  UIColor 支持 HSL 颜色模型，可以获取 HSL 值，HSL 值区间 [0, 1]
//  可以根据 HSL 的值初始化 UIColor
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//


import UIKit



public extension UIColor {
    
    
    /// hsl 模型值，区间 [0, 1]
    var hsl: (CGFloat, CGFloat, CGFloat) {
        let (h, s, v) = hsv
        let hh = h
        var ll = (2 - s) * v
        var ss = s * v
        ss /= ll <= 1 ? ll : 2 - ll
        ll /= 2
        return (hh, ss, ll)
    }
    
    /// 根据 HSL 模型初始化 UIColor
    ///
    /// - Parameters:
    ///   - hue: hue 区间 [0, 1]
    ///   - saturation: saturation 区间 [0, 1]
    ///   - lightness: lightness 区间 [0, 1]
    ///   - alpha: alpha 区间 [0, 1]
    convenience init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat = 1) {
        
        let h = hue
        let ll = lightness * 2
        let ss = saturation * (ll <= 1 ? ll : 2 - ll)
        let v = (ll + ss) / 2
        let s = (2 * ss) / (ll + ss)
        self.init(hue: h, saturation: s, brightness: v, alpha: alpha)
    }
    
    
    /// 变暗
    /// 在原来亮度基础上减去 amount
    ///
    /// - Parameter amount: amount
    /// - Returns: 转换后的颜色
    func darken(byAmount amount: CGFloat) -> UIColor {
        let (h, s, l) = hsl
        return UIColor(hue: h,
                       saturation: s,
                       lightness: max(0, min(l - amount, 1)),
                       alpha:1)
    }
    
    
    /// 根据比例变暗
    /// 在原来基础上乘 (1 - ratio)
    ///
    /// - Parameter ratio: ratio
    /// - Returns: 转换后的颜色
    func darken(byRatio ratio: CGFloat) -> UIColor {
        let (h, s, l) = hsl
        return UIColor(hue: h,
                       saturation: s,
                       lightness: min(1, max(l * (1 - ratio), 0)),
                       alpha: 1)
    }
    
    
    /// 增加亮度
    /// 亮度在原来基础上加 amount
    ///
    /// - Parameter amount: amount
    /// - Returns: 转换后的颜色
    func lighten(byAmount amount: CGFloat) -> UIColor {
        return darken(byAmount: -amount)
    }
    
    
    /// 增加亮度
    /// 在原来基础上乘 (1 + ratio)
    ///
    /// - Parameter ratio: ratio
    /// - Returns: 转换后的颜色
    func lighten(byRatio ratio: CGFloat) -> UIColor {
        return darken(byRatio:-ratio)
    }
}






