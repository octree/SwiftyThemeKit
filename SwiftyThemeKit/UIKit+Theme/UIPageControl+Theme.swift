//
//  UIPageControl+Theme.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

public extension ThemeKit where Base: UIPageControl {
    
    var pageIndicatorTintColor: KeyPath<Theme, UIColor>? {
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.pageIndicatorTintColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
    
    var currentPageIndicatorTintColor: KeyPath<Theme, UIColor>? {
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.currentPageIndicatorTintColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
}

