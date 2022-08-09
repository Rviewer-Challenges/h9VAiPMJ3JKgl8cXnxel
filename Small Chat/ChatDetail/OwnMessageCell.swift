//
//  OwnMessageCell.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import UIKit

class OwnMessageCell: UITableViewCell {
    static let identifier: String = "OwnMessageCell"
    
    private weak var lblMessage: UILabel?
    private weak var lblTime: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .bgColor
        selectionStyle = .none
        
        let lblMessage: UILabel = UILabel.with(font: .text(), color: .white, alignment: .right)
        self.lblMessage = lblMessage
        
        let lblTime: UILabel = UILabel.with(font: .smallText(), color: UIColor(white: 1.0, alpha: 0.8), alignment: .right)
        self.lblTime = lblTime
        
        let bgView: UIView = UIView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.backgroundColor = .systemBlue
        bgView.layer.cornerRadius = 20
        bgView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        contentView.addSubview(bgView)
        contentView.addSubview(lblMessage)
        contentView.addSubview(lblTime)
        
        NSLayoutConstraint.activate([
            
            bgView.topAnchor.constraint(equalTo: lblMessage.topAnchor, constant: -12),
            bgView.leadingAnchor.constraint(equalTo: lblMessage.leadingAnchor, constant: -16),
            bgView.trailingAnchor.constraint(equalTo: lblMessage.trailingAnchor, constant: 16),
            bgView.bottomAnchor.constraint(equalTo: lblTime.bottomAnchor, constant: 12),
            
            lblMessage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            lblMessage.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 20),
            lblMessage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            lblMessage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            
            lblTime.topAnchor.constraint(equalTo: lblMessage.bottomAnchor),
            lblTime.trailingAnchor.constraint(equalTo: lblMessage.trailingAnchor),
        ])
    }
    
    func config(with message: Message) {
        lblMessage?.text = message.message
        lblTime?.text = message.date.messageDisplayDate()
    }
}
