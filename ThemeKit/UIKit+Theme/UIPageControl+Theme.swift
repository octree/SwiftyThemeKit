//
//  UIPageControl+Theme.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

public extension ThemeKit where Base: UIPageControl {
    
    public var pageIndicatorTintColor: WritableKeyPath<Theme, UIColor>? {
        
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
    
    public var currentPageIndicatorTintColor: WritableKeyPath<Theme, UIColor>? {
        
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

