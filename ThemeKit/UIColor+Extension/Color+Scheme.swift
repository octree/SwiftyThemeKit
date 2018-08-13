import UIKit

public extension UIColor {
    
    public func scheme(from degrees: [CGFloat]) -> [UIColor] {
        
        let (h, s, v, a) = hsva
        return degrees.map {
            return UIColor(hue: (h + $0).truncatingRemainder(dividingBy: 1),
                           saturation: s,
                           brightness: v,
                           alpha:a)
        }
    }
    
    //    互补色
    public var complementaryScheme: [UIColor] {
        return scheme(from: [0, 0.5])
    }
    
    public var splitComplementaryScheme: [UIColor] {
        return scheme(from: [0, CGFloat(150.0 / 360), CGFloat(320.0 / 360) ])
    }
    
    public var splitComplementaryCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(150.0 / 360), CGFloat(300.0 / 360) ])
    }
    
    public var splitComplementaryCCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(60.0 / 360), CGFloat(210.0 / 360) ])
    }
    //    三分
    public var triadicScheme: [UIColor] {
        return scheme(from: [0, CGFloat(120.0 / 360), CGFloat(240.0 / 360) ])
    }
    //
    public var clashScheme: [UIColor] {
        return scheme(from: [0, CGFloat(90.0 / 360), CGFloat(270.0 / 360) ])
    }
    //    四个相反色
    public var tetradicScheme: [UIColor] {
        return scheme(from: [0, CGFloat(90.0 / 360), CGFloat(180.0 / 360),  CGFloat(270.0 / 360)])
    }
    
    public var fourToneCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(60.0 / 360), CGFloat(180.0 / 360),  CGFloat(240.0 / 360)])
    }
    
    public var fourToneCCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(120.0 / 360), CGFloat(180.0 / 360),  CGFloat(300.0 / 360)])
    }
    
    public var fiveToneAScheme: [UIColor] {
        return scheme(from: [0, CGFloat(115.0 / 360), CGFloat(155.0 / 360),  CGFloat(205.0 / 360), CGFloat(245.0 / 360)])
    }
    
    public var fiveToneBScheme: [UIColor] {
        return scheme(from: [0, CGFloat(40.0 / 360), CGFloat(90.0 / 360),  CGFloat(130.0 / 360), CGFloat(245.0 / 360)])
    }
    
    public var fiveToneCScheme: [UIColor] {
        return scheme(from: [0, CGFloat(50.0 / 360), CGFloat(90.0 / 360),  CGFloat(205.0 / 360), CGFloat(320.0 / 360)])
    }
    
    public var fiveToneDScheme: [UIColor] {
        return scheme(from: [0, CGFloat(40.0 / 360), CGFloat(155.0 / 360),  CGFloat(270.0 / 360), CGFloat(310.0 / 360)])
    }
    
    public var fiveToneEScheme: [UIColor] {
        return scheme(from: [0, CGFloat(115.0 / 360), CGFloat(230.0 / 360),  CGFloat(270.0 / 360), CGFloat(320.0 / 360)])
    }
    
    public var sixToneCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(30.0 / 360), CGFloat(120.0 / 360),  CGFloat(150.0 / 360), CGFloat(240.0 / 360), CGFloat(270.0 / 360)])
    }
    
    public var sixToneCCWScheme: [UIColor] {
        return scheme(from: [0, CGFloat(90.0 / 360), CGFloat(120.0 / 360),  CGFloat(210.0 / 360), CGFloat(240.0 / 360), CGFloat(330.0 / 360)])
    }
    
    public var neutralScheme: [UIColor] {
        return scheme(from: [0, CGFloat(15.0 / 360), CGFloat(30.0 / 360),  CGFloat(45.0 / 360), CGFloat(60.0 / 360), CGFloat(75.0 / 360)])
    }
    
    public var analogousScheme: [UIColor] {
        return scheme(from: [0, CGFloat(30.0 / 360), CGFloat(60.0 / 360),  CGFloat(90.0 / 360), CGFloat(120.0 / 360), CGFloat(150.0 / 360)])
    }
    
}
