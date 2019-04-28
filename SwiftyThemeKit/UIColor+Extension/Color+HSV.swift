//
//  Color+HSV.swift
//  Color+HSV
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//


import UIKit


///  HSL（HSB） 模型
public extension UIColor {
    
    
    /// 获取 HSLA 的值，区间 [0, 1]
    var hsva:(CGFloat, CGFloat, CGFloat, CGFloat) {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return (hue, saturation, brightness, alpha)
    }
    
    /// 获取 HSL 的值，区间 [0, 1]
    var hsv:(CGFloat, CGFloat, CGFloat) {
        let (h, s, v, _) = hsva
        return (h, s, v)
    }
}


//  根据 HSV(HSB) 格式进行变换
public extension UIColor {
    
    
    /// 转换色相（hue）
    /// 在色盘上顺时针旋转 360° * offset
    ///
    /// - Parameter offset: offset 区间 [0, 1]
    /// - Returns: 转换后的颜色
    func shiftHue(by offset: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        let newHue = (h + offset).truncatingRemainder(dividingBy: 1)
        return UIColor(hue: newHue >= 0 ? newHue : newHue + 1 ,
                       saturation: s,
                       brightness: v,
                       alpha: a)
    }
    
    
    /// 减小明度
    /// 明度减去 amount
    ///
    /// - Parameter amount: amount
    /// - Returns: 转换后的颜色
    func devalue(byAmount amount: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        return UIColor(hue: h,
                       saturation: s,
                       brightness: max(0, min(v - amount, 1)),
                       alpha: a)
    }
    
    
    /// 根据比例减小明度
    /// 在原来的基础上乘 (1 - amount)
    ///
    /// - Parameter ratio: ratio
    /// - Returns: 转换后的颜色
    func devalue(byRatio ratio: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        return UIColor(hue: h,
                       saturation: s,
                       brightness: min(1, max(v * (1 - ratio), 0)),
                       alpha: a)
    }
    
    
    /// 增加明度
    /// 在原来基础上加 amount
    ///
    /// - Parameter amount: amount
    /// - Returns: 转换后的颜色
    func value(byAmount amount: CGFloat) -> UIColor {
        return devalue(byAmount: -amount)
    }
    
    
    /// 根据比例增加明度
    /// 在原来基础上乘（1 + amount）
    ///
    /// - Parameter ratio: ratio
    /// - Returns: 转换后的颜色
    func value(byRatio ratio: CGFloat) -> UIColor {
        return devalue(byRatio:-ratio)
    }
    
    
    /// 减小饱和度
    /// 在原来基础上加 amount
    ///
    /// - Parameter amount: amount
    /// - Returns: 转换后的颜色
    func desaturate(byAmount amount: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        return UIColor(hue: h,
                       saturation: max(0, min(s - amount, 1)),
                       brightness: v,
                       alpha: a)
    }
    
    
    /// 根据比例减小饱和度
    /// 在原来基础上乘（1 - amount）
    ///
    /// - Parameter ratio: ratio
    /// - Returns: 转换后的颜色
    func desaturate(byRatio ratio: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        return UIColor(hue: h,
                       saturation: min(1, max(s * (1 - ratio), 0)),
                       brightness: v,
                       alpha: a)
    }
    
    /// 增加饱和度
    /// 在原来基础上加 amount
    ///
    /// - Parameter amount: amount
    /// - Returns: 转换后的颜色
    func saturate(byAmount amount: CGFloat) -> UIColor {
        return desaturate(byAmount: -amount)
    }
    
    /// 根据比例增加饱和度
    /// 在原来基础上乘（1 - amount）
    ///
    /// - Parameter ratio: ratio
    /// - Returns: 转换后的颜色
    func saturate(byRatio ratio: CGFloat) -> UIColor {
        return desaturate(byRatio:-ratio)
    }
}

