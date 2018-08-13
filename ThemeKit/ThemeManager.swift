//
//  ThemeManager.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

public final class ThemeManager {
    
    static let ThemeUpdate = Notification.Name(rawValue: "TKThemeUpdate")
    
    public enum Style {
        case light
        case night
        case dark
    }
    
    public static let shared = ThemeManager()
    public private(set) var primaryColor = UIColor(hex6: 0xf44336)
    public private(set) var style: Style = .light
    public private(set) var theme: Theme
    
    init() {
        theme = primaryColor.lightTheme
    }
    
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
