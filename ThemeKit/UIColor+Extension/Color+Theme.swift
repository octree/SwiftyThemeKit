import UIKit

/*
 darkText: {
 primary: "rgba(0, 0, 0, 0.87)",
 secondary: "rgba(0, 0, 0, 0.54)",
 disabled: "rgba(0, 0, 0, 0.38)",
 dividers: "rgba(0, 0, 0, 0.12)"
 },
 lightText: {
 primary: "rgba(255, 255, 255, 1)",
 secondary: "rgba(255, 255, 255, 0.7)",
 disabled: "rgba(255, 255, 255, 0.5)",
 dividers: "rgba(255, 255, 255, 0.12)"
 },
 darkIcons: {
 active: "rgba(0, 0, 0, 0.54)",
 inactive: "rgba(0, 0, 0, 0.38)"
 },
 lightIcons: {
 active: "rgba(255, 255, 255, 1)",
 inactive: "rgba(255, 255, 255, 0.5)"
 },
 */

public extension UIColor {
    
    public var textColor: UIColor {
        
        let (r, g, b) = rgbComponents
        let gray = 0.299 * r + 0.587 * g + 0.114 * b
        return gray > 0.73 ? .black : .white
    }
    
    public var destructiveColor: UIColor {
        let (h, s, l) = hsl
        
        return h < 30 || h > 330 ? UIColor(hue: 0, saturation: s, lightness: l) : self
    }
}

public struct Theme {
    
    public struct Base {
        
        public var positive: UIColor
        public var darkPositive: UIColor
        public var destructive: UIColor
    }
    
    public struct Text {
        
        /// 一级
        var primary: UIColor
        /// 二级
        var secondary: UIColor
        /// 三级
        var tertiary: UIColor
        
        /// disabled
        var disabled: UIColor
        
        var overPositive: UIColor
    }
    
    public struct Icon {
        
        var active: UIColor
        var inactive: UIColor
    }
    
    public struct Background {
//        Bar 的颜色
        var bar: UIColor
        var scene: UIColor
//        背景颜色
        var primary: UIColor
//        二级背景颜色
        var secondary: UIColor
    }
    
    public struct Border {
        
        //   border 颜色
        var primary: UIColor
        //   二级 border 颜色
        var secondary: UIColor
    }
    
    public var base: Base
    public var background: Background
    public var text: Text
    public var border: Border
    public var icon: Icon
}

public extension UIColor {
    
    public var lightTheme: Theme {
        
        let base = Theme.Base(positive: self,
                              darkPositive: darken(byRatio: 0.25),
                              destructive: self.destructiveColor)
        let background = Theme.Background(bar: UIColor(hex6: 0xffffff),
                                          scene: UIColor(hex6: 0xffffff),
                                          primary: UIColor(hex6: 0xf1f1f1),
                                          secondary: UIColor(hex6: 0xffffff))
        let border = Theme.Border(primary: UIColor(hex6: 0xdddddd),
                                  secondary: UIColor(hex6: 0xeeeeee))
        
        let text = Theme.Text(primary: UIColor(hex6: 0x000000),
                              secondary:  UIColor(hex6: 0x222222),
                              tertiary: UIColor(hex6: 0x888888),
                              disabled: UIColor.black.withAlphaComponent(0.12),
                              overPositive: textColor)
        
        let icon = Theme.Icon(active: UIColor.black.withAlphaComponent(0.54),
                              inactive: UIColor.black.withAlphaComponent(0.38))
        
        return Theme(base: base, background: background, text: text, border: border, icon: icon)
    }
    
    public var nightTheme: Theme {
        let r = UIColor(hex6: 0x1C2835)
        let base = Theme.Base(positive: self,
                              darkPositive: darken(byRatio: 0.25),
                              destructive: self.destructiveColor)
        
        let background = Theme.Background(bar: UIColor(hex6: 0x263345),
                                          scene: r,
                                          primary: UIColor(hex6: 0x263345),
                                          secondary: r)
        let border = Theme.Border(primary: UIColor(hex6: 0x101822),
                                  secondary: UIColor(hex6: 0x101822))
        
        let text = Theme.Text(primary: UIColor(hex6: 0xffffff),
                              secondary:  UIColor(hex6: 0xeeeeee),
                              tertiary: UIColor(hex6: 0xaaaaaa),
                              disabled: UIColor.white.withAlphaComponent(0.12),
                              overPositive: textColor)
        
        let icon = Theme.Icon(active: UIColor.white,
                              inactive: UIColor.white.withAlphaComponent(0.5))
        
        return Theme(base: base, background: background, text: text, border: border, icon: icon)
    }
    
    public var darkTheme: Theme {
        
        let base = Theme.Base(positive: self,
                              darkPositive: darken(byRatio: 0.25),
                              destructive: self.destructiveColor)
        
        let background = Theme.Background(bar: UIColor(hex6: 0x333333),
                                          scene: UIColor(hex6: 0x000000),
                                          primary: UIColor(hex6: 0x333333),
                                          secondary: UIColor(hex6: 0x333333))
        let border = Theme.Border(primary: UIColor(hex6: 0x444444),
                                  secondary: UIColor(hex6: 0x222222))
        
        let text = Theme.Text(primary: UIColor(hex6: 0xffffff),
                              secondary:  UIColor(hex6: 0xeeeeee),
                              tertiary: UIColor(hex6: 0xaaaaaa),
                              disabled: UIColor.white.withAlphaComponent(0.12),
                              overPositive: textColor)
        
        let icon = Theme.Icon(active: UIColor.white,
                              inactive: UIColor.white.withAlphaComponent(0.5))
        
        return Theme(base: base, background: background, text: text, border: border, icon: icon)
    }
}


