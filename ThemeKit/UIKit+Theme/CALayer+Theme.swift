//
//  CALayer+Theme.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

public extension ThemeKit where Base: CALayer {
    
    public var backgroundColor: KeyPath<Theme, UIColor>? {
        
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.backgroundColor = color.cgColor
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
    
    public var borderColor: KeyPath<Theme, UIColor>? {
        
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.borderColor = color.cgColor
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
}

public extension ThemeKit where Base: CAShapeLayer {
    
    public var strokeColor: KeyPath<Theme, UIColor>? {
        
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.strokeColor = color.cgColor
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
    
    public var fillColor: KeyPath<Theme, UIColor>? {
        
        set {
            let base = self.base
            setPicker(keyPath: newValue, render: {
                color in
                base.fillColor = color.cgColor
            })
        }
        get {
            return getPicker()?.keyPath
        }
    }
}
