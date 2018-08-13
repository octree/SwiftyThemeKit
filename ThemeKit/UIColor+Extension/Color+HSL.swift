import UIKit

public extension UIColor {
    
    public var hsl: (CGFloat, CGFloat, CGFloat) {
        let (h, s, v) = hsv
        let hh = h
        var ll = (2 - s) * v
        var ss = s * v
        ss /= ll <= 1 ? ll : 2 - ll
        ll /= 2
        return (hh, ss, ll)
    }
    
    public convenience init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat = 1) {
        
        let h = hue
        let ll = lightness * 2
        let ss = saturation * (ll <= 1 ? ll : 2 - ll)
        let v = (ll + ss) / 2
        let s = (2 * ss) / (ll + ss)
        self.init(hue: h, saturation: s, brightness: v, alpha: alpha)
    }
    
    public func darken(byAmount amount: CGFloat) -> UIColor {
        let (h, s, l) = hsl
        return UIColor(hue: h,
                       saturation: s,
                       lightness: max(0, min(l - amount, 1)),
                       alpha:1)
    }
    
    public func darken(byRatio ratio: CGFloat) -> UIColor {
        let (h, s, l) = hsl
        return UIColor(hue: h,
                       saturation: s,
                       lightness: min(1, max(l * (1 - ratio), 0)),
                       alpha: 1)
    }
    
    public func lighten(byAmount amount: CGFloat) -> UIColor {
        return darken(byAmount: -amount)
    }
    
    public func lighten(byRatio ratio: CGFloat) -> UIColor {
        return darken(byRatio:-ratio)
    }
}






