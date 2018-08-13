//
//  ThemeKit.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

private var kThemeKitAssociateKey = "kThemeKitAssociateKey"

public class ThemeKit<Base: AnyObject> {
    
    public unowned let  base: Base
    private var pickers = [String: Any]()
    private var statePickers = [String: [UInt: Any]]()
    init(_ base: Base) {
        self.base = base
    }
}

public extension ThemeKit {
    
    
    /// 设置 ThemePicker
    ///
    /// - Parameters:
    ///   - keyPath: Theme Keypath
    ///   - render: 渲染函数
    ///   - key: 默认为 #function，一般是属性的名称
    public func setPicker<T>(keyPath: WritableKeyPath<Theme, T>?, render: @escaping (T) -> Void, key: String = #function) {
        
        if let kp = keyPath {
            pickers[key] = ThemePicker(keyPath: kp, render: render)
        } else {
             pickers[key] = nil
        }
        
    }
    
    /// 获取 Theme Picker
    ///
    /// - Parameter key: 默认为 #function，一般是属性的名称
    /// - Returns: ThemePicker or nil
    public func getPicker<T>(key: String = #function) -> ThemePicker<T>? {
        return pickers[key] as? ThemePicker<T>
    }
    
    public func setStatePicker<T>(keyPath: WritableKeyPath<Theme, T>?, forState state: UIControl.State, render: @escaping (T) -> Void, key: String = #function) {
        var pickers = statePickers[key] ?? [UInt: Any]()
        if let kp = keyPath {
            pickers[state.rawValue] = ThemePicker(keyPath: kp, render: render)
        } else {
            pickers[state.rawValue] = nil
        }
        statePickers[key] = pickers
    }
}

public protocol ThemeKitCompatible: class {
    
    associatedtype CompatibleType: AnyObject
    static var tk: ThemeKit<CompatibleType>.Type { get set }
    var tk: ThemeKit<CompatibleType> { get set }
}


public extension ThemeKitCompatible {
    
    public static var tk: ThemeKit<Self>.Type {
        get {
            return ThemeKit<Self>.self
        }
        set {
        }
    }

    public var tk: ThemeKit<Self> {
        get {
            
            if let tk = objc_getAssociatedObject(self, &kThemeKitAssociateKey) as? ThemeKit<Self> {
                return tk
            } else {
                
                let tk = ThemeKit(self)
                objc_setAssociatedObject(self, &kThemeKitAssociateKey, tk, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return tk
            }
        }
        set {
            objc_setAssociatedObject(self, &kThemeKitAssociateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
