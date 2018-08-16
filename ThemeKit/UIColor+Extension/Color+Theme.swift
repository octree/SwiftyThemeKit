//
//  Color+Theme.swift
//  Color+Theme
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//


import UIKit

/*
 darkText: {
 primary: "rgba(0, 0, 0, 0.87)",
 secondary: "rgba(0, 0, 0, 0.54)",
 disabled: "rgba(0, 0, 0, 0.38)",
 dividers: "rgba(0, 0, 0, 0.12)"
 },
 lightText: {
 primary: "rgba(255, 255, 255, 1)",
 secondary: "rgba(255, 255, 255, 0.7)",
 disabled: "rgba(255, 255, 255, 0.5)",
 dividers: "rgba(255, 255, 255, 0.12)"
 },
 darkIcons: {
 active: "rgba(0, 0, 0, 0.54)",
 inactive: "rgba(0, 0, 0, 0.38)"
 },
 lightIcons: {
 active: "rgba(255, 255, 255, 1)",
 inactive: "rgba(255, 255, 255, 0.5)"
 },
 */


public extension UIColor {
    
    
    /// 以当前颜色为背景时，背景上的字体的颜色，自动判断使用黑色还是白色
    public var textColor: UIColor {
        
        let (r, g, b) = rgbComponents
        let gray = 0.299 * r + 0.587 * g + 0.114 * b
        return gray > 0.73 ? .black : .white
    }
    
    /// 当前颜色作为主题色时，判断警告颜色 （eg：删除按钮...）
    public var destructiveColor: UIColor {
        let (h, s, l) = hsl
        
        return h < 30 || h > 330 ? UIColor(hue: 0, saturation: s, lightness: l) : self
    }
}


/// 配色主题
/// 这里目前只加入了颜色，其实可以加入字体等主题
public struct Theme {
    
    
    /// 基础配色
    public struct Base {
        
        /// 选择的主题色
        public var positive: UIColor
        
        /// 暗一点的主题色，这个一般用不到
        public var darkPositive: UIColor
        
        /// 警告色
        public var destructive: UIColor
    }
    
    /// 字体
    public struct Text {
        
        /// 一级
        public var primary: UIColor
        /// 二级
        public var secondary: UIColor
        /// 三级
        public var tertiary: UIColor
        
        /// disabled
        public var disabled: UIColor
        
        /// 当背景是主题色时，字体要显示的颜色
        public var overPositive: UIColor
    }
    
    
    /// 图标的 Tint Color
    public struct Icon {
        
        /// 激活状态
        public var active: UIColor
        
        /// 为激活状态
        public var inactive: UIColor
    }
    
    
    /// 背景颜色
    public struct Background {
//        Bar 的颜色
        public var bar: UIColor
//        背景颜色
        public var primary: UIColor
//        二级背景颜色
        public var secondary: UIColor
        
         /// scene 背景颜色
         public var scene: UIColor
    }
    
    
    /// 边框
    public struct Border {
        
        //   border 颜色
        public var primary: UIColor
        //   二级 border 颜色
        public var secondary: UIColor
    }
    
    /// 基础主题
    public var base: Base
    
    /// 背景主题
    public var background: Background
    
    /// 文本主题
    public var text: Text
    
    /// 边框主题
    public var border: Border
    
    /// 图标主题
    public var icon: Icon
}

public extension UIColor {
    
    
    /// 以当前颜色为主题颜色，生成日间主题配色方案
    public var lightTheme: Theme {
        
        let base = Theme.Base(positive: self,
                              darkPositive: darken(byRatio: 0.25),
                              destructive: self.destructiveColor)
        let background = Theme.Background(bar: UIColor(hex6: 0xffffff),
                                          primary: UIColor(hex6: 0xffffff),
                                          secondary: UIColor(hex6: 0xf1f1f1),
                                          scene: UIColor(hex6: 0xffffff))
        
        let border = Theme.Border(primary: UIColor(hex6: 0xdddddd),
                                  secondary: UIColor(hex6: 0xeeeeee))
        
        let text = Theme.Text(primary: UIColor(hex6: 0x000000),
                              secondary:  UIColor(hex6: 0x222222),
                              tertiary: UIColor(hex6: 0x888888),
                              disabled: UIColor.black.withAlphaComponent(0.12),
                              overPositive: textColor)
        
        let icon = Theme.Icon(active: UIColor.black.withAlphaComponent(0.54),
                              inactive: UIColor.black.withAlphaComponent(0.38))
        
        return Theme(base: base, background: background, text: text, border: border, icon: icon)
    }
    
    /// 以当前颜色为主题颜色，生成夜间主题配色方案
    public var nightTheme: Theme {
        let r = UIColor(hex6: 0x1C2835)
        let base = Theme.Base(positive: self,
                              darkPositive: darken(byRatio: 0.25),
                              destructive: self.destructiveColor)
        
        let background = Theme.Background(bar: UIColor(hex6: 0x263345),
                                          primary: r,
                                          secondary: UIColor(hex6: 0x263345),
                                          scene: r)
        let border = Theme.Border(primary: UIColor(hex6: 0x101822),
                                  secondary: UIColor(hex6: 0x101822))
        
        let text = Theme.Text(primary: UIColor(hex6: 0xffffff),
                              secondary:  UIColor(hex6: 0xeeeeee),
                              tertiary: UIColor(hex6: 0xaaaaaa),
                              disabled: UIColor.white.withAlphaComponent(0.12),
                              overPositive: textColor)
        
        let icon = Theme.Icon(active: UIColor.white,
                              inactive: UIColor.white.withAlphaComponent(0.5))
        
        return Theme(base: base, background: background, text: text, border: border, icon: icon)
    }
    
    /// 以当前颜色为主题颜色，生成暗黑主题配色方案，个人感觉很难看
    public var darkTheme: Theme {
        
        let base = Theme.Base(positive: self,
                              darkPositive: darken(byRatio: 0.25),
                              destructive: self.destructiveColor)
        
        let background = Theme.Background(bar: UIColor(hex6: 0x333333),
                                          primary: UIColor(hex6: 0x333333),
                                          secondary: UIColor(hex6: 0x333333),
                                          scene: UIColor(hex6: 0x000000))
        
        let border = Theme.Border(primary: UIColor(hex6: 0x444444),
                                  secondary: UIColor(hex6: 0x222222))
        
        let text = Theme.Text(primary: UIColor(hex6: 0xffffff),
                              secondary:  UIColor(hex6: 0xeeeeee),
                              tertiary: UIColor(hex6: 0xaaaaaa),
                              disabled: UIColor.white.withAlphaComponent(0.12),
                              overPositive: textColor)
        
        let icon = Theme.Icon(active: UIColor.white,
                              inactive: UIColor.white.withAlphaComponent(0.5))
        
        return Theme(base: base, background: background, text: text, border: border, icon: icon)
    }
}


