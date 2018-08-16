//
//  ThemeKit.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

private var kThemeKitAssociateKey = "kThemeKitAssociateKey"

/// ThemeKit 用来修改 View 的主题
/// 这里使用的 class 类型，因为如果一个 object 是 let 的，则它的 struct 的类型的属性也不能修改
public class ThemeKit<Base: AnyObject> {
    
    
    /// 一般是一个 UIView 或者它的子类
    public unowned let base: Base
    
    /// String：ThemePicker
    private var pickers = [String: Any]()
    
    /// String: [UIControl.State: ThemePicker]
    private var statePickers = [String: [UInt: Any]]()
    init(_ base: Base) {
        self.base = base
    }
}


// MARK: - Picker
// 注册 picker，可以
public extension ThemeKit {
    
    
    /// 设置 ThemePicker
    ///
    /// - Parameters:
    ///   - keyPath: Theme Keypath
    ///   - render: 渲染函数
    ///   - key: 默认为 #function，一般是属性的名称
    public func setPicker<T>(keyPath: KeyPath<Theme, T>?, render: @escaping (T) -> Void, key: String = #function) {
        
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
    
    
    /// 设置 statePicker
    ///
    /// - Parameters:
    ///   - keyPath: Theme KeyPath, 用来指定主题
    ///   - state:  UIControl.State
    ///   - render: 渲染函数
    ///   - key: 对应不同属性，这里默认使用 #function
    public func setStatePicker<T>(keyPath: KeyPath<Theme, T>?, forState state: UIControl.State, render: @escaping (T) -> Void, key: String = #function) {
        var pickers = statePickers[key] ?? [UInt: Any]()
        if let kp = keyPath {
            pickers[state.rawValue] = ThemePicker(keyPath: kp, render: render)
        } else {
            pickers[state.rawValue] = nil
        }
        statePickers[key] = pickers
    }
}


///  兼容 ThemeKit 的协议
public protocol ThemeKitCompatible: class {
    
    associatedtype CompatibleType: AnyObject
    static var tk: ThemeKit<CompatibleType>.Type { get set }
    var tk: ThemeKit<CompatibleType> { get set }
}


// 添加默认实现
// 实现这个协议之后，对应的类和实例就有了 tk 属性
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
