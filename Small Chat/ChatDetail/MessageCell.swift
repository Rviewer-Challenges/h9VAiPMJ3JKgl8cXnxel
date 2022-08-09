//
//  MessageCell.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import UIKit

class MessageCell: UITableViewCell {
    static let identifier: String = "MessageCell"
    
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
        
        let lblMessage: UILabel = UILabel.with(font: .text())
        self.lblMessage = lblMessage
        
        let lblTime: UILabel = UILabel.with(font: .smallText(), color: .textColor.withAlphaComponent(0.7))
        self.lblTime = lblTime
        
        let bgView: UIView = UIView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.backgroundColor = .msgGray
        bgView.layer.cornerRadius = 20
        bgView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        contentView.addSubview(bgView)
        contentView.addSubview(lblMessage)
        contentView.addSubview(lblTime)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: lblMessage.topAnchor, constant: -12),
            bgView.leadingAnchor.constraint(equalTo: lblMessage.leadingAnchor, constant: -16),
            bgView.trailingAnchor.constraint(equalTo: lblMessage.trailingAnchor, constant: 16),
            bgView.bottomAnchor.constraint(equalTo: lblTime.bottomAnchor, constant: 12),
            
            lblMessage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            lblMessage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            lblMessage.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20),
            lblMessage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            
            lblTime.topAnchor.constraint(equalTo: lblMessage.bottomAnchor),
            lblTime.leadingAnchor.constraint(equalTo: lblMessage.leadingAnchor)
        ])
    }
    
    func config(with message: Message) {
        lblMessage?.text = message.message
        lblTime?.text = message.date.messageDisplayDate()
    }
}
