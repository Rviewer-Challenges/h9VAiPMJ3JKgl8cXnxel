//
//  UILabelExtension.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 08/08/22.
//

import UIKit

extension UILabel {
    static func with(text: String? = nil, font: UIFont, color: UIColor = .textColor, alignment: NSTextAlignment = .left) -> UILabel {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.text = text
        label.textColor = color
        label.textAlignment = alignment
        label.numberOfLines = 0
        return label
    }
}
