import UIKit

//  根据 HSV(HSB) 格式进行变换
public extension UIColor {
    
    public func shiftHue(by offset: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        let newHue = (h + offset).truncatingRemainder(dividingBy: 1)
        return UIColor(hue: newHue >= 0 ? newHue : newHue + 1 ,
                       saturation: s,
                       brightness: v,
                       alpha: a)
    }
    
    public func devalue(byAmount amount: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        return UIColor(hue: h,
                       saturation: s,
                       brightness: max(0, min(v - amount, 1)),
                       alpha: a)
    }
    
    public func devalue(byRatio ratio: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        return UIColor(hue: h,
                       saturation: s,
                       brightness: min(1, max(v * (1 - ratio), 0)),
                       alpha: a)
    }
    
    public func value(byAmount amount: CGFloat) -> UIColor {
        return devalue(byAmount: -amount)
    }
    
    public func value(byRatio ratio: CGFloat) -> UIColor {
        return devalue(byRatio:-ratio)
    }
    
    public func desaturate(byAmount amount: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        return UIColor(hue: h,
                       saturation: max(0, min(s - amount, 1)),
                       brightness: v,
                       alpha: a)
    }
    
    public func desaturate(byRatio ratio: CGFloat) -> UIColor {
        let (h, s, v, a) = hsva
        return UIColor(hue: h,
                       saturation: min(1, max(s * (1 - ratio), 0)),
                       brightness: v,
                       alpha: a)
    }
    
    public func saturate(byAmount amount: CGFloat) -> UIColor {
        return desaturate(byAmount: -amount)
    }
    
    public func saturate(byRatio ratio: CGFloat) -> UIColor {
        return desaturate(byRatio:-ratio)
    }
}

