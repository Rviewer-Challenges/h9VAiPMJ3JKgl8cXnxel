//
//  UIColorExtension.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 08/08/22.
//

import UIKit

extension UIColor {
    static var textColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? UIColor(red: 0.969, green: 0.973, blue: 0.980, alpha: 1) : UIColor(red: 0.106, green: 0.102, blue: 0.157, alpha: 1)
        }
    }
    
    static let bgColor: UIColor = UIColor(named: "backgroundColor") ?? UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.00)
    static let bgBlue: UIColor = UIColor(named: "bgBlue") ?? UIColor(red: 0.01, green: 0.46, blue: 0.73, alpha: 1.00)
    static let bgGray: UIColor = UIColor(named: "bgGray") ?? UIColor(red: 0.09, green: 0.15, blue: 0.22, alpha: 1.00)
    static let facebook: UIColor = UIColor(named: "facebook") ?? UIColor(red: 0.23, green: 0.35, blue: 0.60, alpha: 1.00)
    static let msgGray: UIColor = UIColor(named: "msgGray") ?? UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
}
