//
//  UIColor.swift
//  AQI
//
//  Created by Joel Youngblood on 4/20/24.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        
        let scanner  = Scanner(string: hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        
        if (hex.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}

extension UIColor {
    
    static var blue1: UIColor {
        return UIColor(hex: "2539b6")
    }
    
    static var blue2: UIColor {
        return UIColor(hex: "24329f")
    }
    
    static var blue3: UIColor {
        return UIColor(hex: "212b89")
    }
    
    static var blue4: UIColor {
        return UIColor(hex: "1e2474")
    }
    
    static var blue5: UIColor {
        return UIColor(hex: "1b1e5f")
    }
}
