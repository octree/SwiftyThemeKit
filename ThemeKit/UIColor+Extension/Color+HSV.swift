import UIKit

public extension UIColor {
    
    public var hsva:(CGFloat, CGFloat, CGFloat, CGFloat) {
        
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return (hue, saturation, brightness, alpha)
    }
    
    public var hsv:(CGFloat, CGFloat, CGFloat) {
        
        let (h, s, v, _) = hsva
        return (h, s, v)
    }
}


public extension UIColor {
    
    public var rgbComponents: (CGFloat, CGFloat, CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: nil)
        return (r, g, b)
    }
}
