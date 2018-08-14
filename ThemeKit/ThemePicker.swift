//
//  ThemePicker.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import Foundation

public final class ThemePicker<Value> {
    
    public let keyPath: KeyPath<Theme, Value>
    private let render: (Value) -> Void
    public init(keyPath:  KeyPath<Theme, Value>, render: @escaping (Value) -> Void) {
        self.keyPath = keyPath
        self.render = render
        themeUpdated()
        NotificationCenter.default.addObserver(self, selector: #selector(themeUpdated), name: ThemeManager.ThemeUpdate, object: nil)
    }
    
    @objc private func themeUpdated() {
        render(ThemeManager.shared.theme[keyPath: keyPath])
    }
}

