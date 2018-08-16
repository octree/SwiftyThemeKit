//
//  Color+Saturation.swift
//  Color+Saturation
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//


import UIKit


// 或者不同饱和度的颜色
// 可以参考 Google 或者其他公司的饱和度方案
// Google MD 设计方案分为 10 种饱和度
// 即本代码中的 S50 - S900
public extension UIColor {
    
    public var S50: UIColor {
        
        return lighten(byAmount: 0.52)
    }
    
    public var S100: UIColor {
        
        return lighten(byAmount: 0.37)
    }
    
    public var S200: UIColor {
        
        return lighten(byAmount: 0.26)
    }
    
    public var S300: UIColor {
        
        return lighten(byAmount: 0.12)
    }
    
    public var S400: UIColor {
        
        return lighten(byAmount: 0.06)
    }
    
    public var S500: UIColor {
        
        return self
    }
    
    public var S600: UIColor {
        
        return darken(byRatio: 0.06)
    }
    
    public var S700: UIColor {
        
        return darken(byRatio: 0.12)
    }
    
    public var S800: UIColor {
        
        return darken(byRatio: 0.18)
    }
    public var S900: UIColor {
        
        return darken(byRatio: 0.24)
    }
    
    public var A100: UIColor {
        
        return shiftHue(by: 5.0/360).lighten(byAmount: 0.24)
    }
    public var A200: UIColor {
        
        return shiftHue(by: 5.0/360).lighten(byAmount: 0.16)
    }
    
    public var A400: UIColor {
        
        return shiftHue(by: 5.0/360).darken(byAmount: 0.01)
    }
    
    public var A700: UIColor {
        
        return shiftHue(by: 5.0/360).lighten(byAmount: 0.12)
    }
}
