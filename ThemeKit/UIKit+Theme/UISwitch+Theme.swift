//
//  UISwitch+Theme.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit


public extension ThemeKit where Base: UISwitch {
    
    public var onTintColor: KeyPath<Theme, UIColor>? {
        
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.onTintColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
    
    public var thumbTintColor: KeyPath<Theme, UIColor>? {
        
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.thumbTintColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
}

