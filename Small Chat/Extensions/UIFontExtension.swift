//
//  UIFontExtension.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import UIKit

public extension UIFont {
    
    
    /// Standarized Merriweather font to be used in normal text
    /// - Parameter size: font size
    /// - Returns: Merriweather font with the specified size
    static func normal(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Merriweather-Regular", size: size)!
    }
    
    static func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Merriweather-Italic", size: size)!
    }
    
    /// Standarized Merriweather-Light font
    /// - Parameter size: font size
    /// - Returns: Merriweather-Light font with the specified size
    static func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Merriweather-Light", size: size)!
    }
    
    /// Standarized Merriweather-LightItalic font
    /// - Parameter size: font size
    /// - Returns: Merriweather-LightItalic font with the specified size
    static func lightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Merriweather-LightItalic", size: size)!
    }
    
    /// Standarized Merriweather-Medium font
    /// - Parameter size: font size
    /// - Returns: Merriweather-Medium font with the specified size
    static func medium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Merriweather-Bold", size: size)!
    }
    
    /// Standarized Merriweather-Heavy font
    /// - Parameter size: font size
    /// - Returns: Merriweather-Heavy font with the specified size
    static func heavy(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Merriweather-Black", size: size)!
    }
    
    /// Standarized font to be used for large titles, default font: Merriweather-Heavy
    /// - Parameter size: font size, default: 25
    /// - Returns: an Merriweather-Heavy font with the specified size
    static func largeTitle(_ size: CGFloat = 25) -> UIFont {
        return .heavy(size)
    }
    
    /// Standarized font to be used for titles, default font: Merriweather-Heavy
    /// - Parameter size: font size, default: 20
    /// - Returns: an Merriweather-Heavy font with the specified size
    static func title(_ size: CGFloat = 20) -> UIFont {
        return .heavy(size)
    }
    
    /// Standarized font to be used for subtitles, default font: Merriweather-Medium
    /// - Parameter size: font size, default: 17
    /// - Returns: an Merriweather-Medium font with the specified size
    static func subtitle(_ size: CGFloat = 17) -> UIFont {
        return .medium(size)
    }
    
    /// Standarized font to be used for normal text, default font: Merriweather
    /// - Parameter size: font size, default: 15
    /// - Returns: an Merriweather font with the specified size
    static func text(_ size: CGFloat = 15) -> UIFont {
        return .normal(size)
    }
    
    /// Standarized font to be used for light text, default font: Merriweather-Light
    /// - Parameter size: font size, default: 12
    /// - Returns: an Merriweather-Light font with the specified size
    static func smallText(_ size: CGFloat = 12) -> UIFont {
        return .light(size)
    }
}

