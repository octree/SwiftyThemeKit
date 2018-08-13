//
//  UIButton+Theme.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

public extension ThemeKit where Base: UIButton {

    public func setTitleColor(_ keyPath: WritableKeyPath<Theme, UIColor>?, forState state: UIControl.State) {
        let base = self.base
        setStatePicker(keyPath: keyPath, forState: state, render: {
            color in
            base.setTitleColor(color, for: state)
        })
    }
}

