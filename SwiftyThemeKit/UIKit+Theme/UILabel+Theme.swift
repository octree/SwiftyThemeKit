//
//  UILabel+Theme.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

public extension ThemeKit where Base: UILabel {
    
    var textColor: KeyPath<Theme, UIColor>? {
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.textColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
    
    var highlightedTextColor: KeyPath<Theme, UIColor>? {
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.highlightedTextColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
    
    var shadowColor: KeyPath<Theme, UIColor>? {
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.shadowColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
}
