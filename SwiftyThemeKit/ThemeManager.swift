//
//  ThemeManager.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit


/// Theme Manager
public final class ThemeManager {
    
    
    ///  主题发生变化时会发送这个通知
    static let ThemeUpdate = Notification.Name(rawValue: "TKThemeUpdate")
    
    /// 主题类型
    ///
    /// - light: 日间模式
    /// - night: 夜间模式
    /// - dark: dark 模式
    public enum Style {
        case light
        case night
        case dark
    }
    
    /// 一个单例
    public static let shared = ThemeManager()
    
    /// 主题色，会根据这个颜色和 style 自动生成主题
    public private(set) var primaryColor = UIColor(hex6: 0xf44336)
    
    /// 样式，和 primaryColor 共同生成主题
    public private(set) var style: Style = .light
    
    /// 当前主题
    public private(set) var theme: Theme
    
    init() {
        theme = primaryColor.lightTheme
    }
    
    
    /// 修改主题
    ///
    /// - Parameters:
    ///   - color: 主题颜色
    ///   - style: 主题类型（日间模式、夜间模式、Dark）
    public func changeTheme(with color: UIColor, style: Style = .light) {
        
        primaryColor = color
        self.style = style
        updateTheme()
    }
    
    private func updateTheme() {
        
        switch style {
        case .light:
            theme = primaryColor.lightTheme
        case .night:
            theme = primaryColor.nightTheme
        case .dark:
            theme = primaryColor.darkTheme
        }
        NotificationCenter.default.post(name: ThemeManager.ThemeUpdate, object: nil)
    }
}
