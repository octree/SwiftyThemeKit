//
//  UITableView+Theme.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

public extension ThemeKit where Base: UITableView {
    
    var separatorColor: KeyPath<Theme, UIColor>? {
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.separatorColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
    
    var sectionIndexColor: KeyPath<Theme, UIColor>? {
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.sectionIndexColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
    
    var sectionIndexBackgroundColor: KeyPath<Theme, UIColor>? {
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.sectionIndexBackgroundColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
}

