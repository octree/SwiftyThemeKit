//
//  UIPopoverPresentationController+Theme.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

public extension ThemeKit where Base: UIPopoverPresentationController {
    
    var backgroundColor: KeyPath<Theme, UIColor>? {    
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.backgroundColor = color
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
}

