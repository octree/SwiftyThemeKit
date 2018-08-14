//
//  UIBarButtonItem+Theme.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

public extension ThemeKit where Base: UIBarButtonItem {
    
    public var tintColor: KeyPath<Theme, UIColor>? {
        
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.tintColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
}

