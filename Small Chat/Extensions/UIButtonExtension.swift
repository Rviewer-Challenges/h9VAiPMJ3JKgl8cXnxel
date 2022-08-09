//
//  UIButtonExtension.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 08/08/22.
//

import UIKit

extension UIButton {
    static func with(title: String? = nil, color: UIColor = .textColor, backgroundColor: UIColor = .clear, radius: CGFloat = 0.0, font: UIFont = .subtitle()) -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = radius
        button.setTitleColor(color, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        return button
    }
}
