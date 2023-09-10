//
//  Style.swift
//  FinalApp
//
//  Created by ln on 11.08.2023.
//

import UIKit

extension UIColor {
    static var textColor: UIColor {
            return UIColor(red: 0.15, green: 0.20, blue: 0.22, alpha: 1.00)
        }
    
    static var buttonColor: UIColor {
            return UIColor(red: 0.17, green: 0.22, blue: 0.25, alpha: 1.00)
        }
    
    static var lightTextColor: UIColor {
            return UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        }
    
    static var mediumTextColor: UIColor {
            return UIColor(red: 0.49, green: 0.51, blue: 0.51, alpha: 1.00)
        }
    
    static var orangeAppColor: UIColor {
            return UIColor(red: 0.96, green: 0.59, blue: 0.03, alpha: 1.00)
        }
}

extension CGColor {
    
    static var textFieldBorder: CGColor {
        return UIColor(red: 0.15, green: 0.20, blue: 0.22, alpha: 1.00).cgColor
    }
}
