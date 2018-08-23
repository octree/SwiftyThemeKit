//
//  ThemePicker.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import Foundation


/// ThemePicker， 获取并渲染指定的主题
/// Value：主题的类型，eg：UIColor，UIFont，CGFloat 等
/// 理论上支持任意类型
public final class ThemePicker<Value> {

    /// 指定主题，这里使用 Theme 结构的 Keypath
    public let keyPath: KeyPath<Theme, Value>
    
    /// 渲染函数，初始化和主题发生变化时会调用这个函数
    private let render: (Value) -> Void
    
    /// ThemePicker
    ///
    /// - Parameters:
    ///   - keyPath: 指定主题，这里使用 Theme 结构的 Keypath
    ///   - render: 渲染函数
    public init(keyPath:  KeyPath<Theme, Value>, render: @escaping (Value) -> Void) {
        
        self.keyPath = keyPath
        self.render = render
        // 第一次初始化，调用渲染函数
        themeUpdated()
        // 监听主题发生变化的通知
        NotificationCenter.default.addObserver(self, selector: #selector(themeUpdated), name: ThemeManager.ThemeUpdate, object: nil)
    }
    
    
    /// 接收到需要的通知后，更新组件的主题
    @objc private func themeUpdated() {
        render(ThemeManager.shared.theme[keyPath: keyPath])
    }
}

