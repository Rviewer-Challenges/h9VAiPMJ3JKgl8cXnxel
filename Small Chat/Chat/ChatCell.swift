//
//  ChatCell.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import UIKit

class ChatCell: UITableViewCell {
    static let identifier: String = "ChatCell"
    
    private let imgSize: CGFloat = 60.0
    
    private weak var imgUser: UIImageView?
    private weak var lblID: UILabel?
    private weak var lblName: UILabel?
    private weak var lblMessage: UILabel?
    private weak var lblDate: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .bgColor
        accessoryType = .disclosureIndicator
        
        let imgUser: UIImageView = UIImageView()
        imgUser.translatesAutoresizingMaskIntoConstraints = false
        imgUser.backgroundColor = .bgGray
        imgUser.layer.cornerRadius = imgSize / 2.0
        self.imgUser = imgUser
        
        let lblID: UILabel = UILabel.with(font: .largeTitle(), alignment: .center)
        self.lblID = lblID
        
        let lblName: UILabel = UILabel.with(font: .subtitle())
        lblName.numberOfLines = 1
        self.lblName = lblName
        
        let lblMessage: UILabel = UILabel.with(font: .text(), color: .textColor.withAlphaComponent(0.7))
        lblMessage.numberOfLines = 1
        self.lblMessage = lblMessage
        
        let lblDate: UILabel = UILabel.with(font: .smallText(), color: .textColor.withAlphaComponent(0.7), alignment: .right)
        lblDate.numberOfLines = 1
        self.lblDate = lblDate
        
        contentView.addSubview(imgUser)
        contentView.addSubview(lblID)
        contentView.addSubview(lblName)
        contentView.addSubview(lblMessage)
        contentView.addSubview(lblDate)
        
        NSLayoutConstraint.activate([
            imgUser.widthAnchor.constraint(equalToConstant: imgSize),
            imgUser.heightAnchor.constraint(equalTo: imgUser.widthAnchor),
            imgUser.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imgUser.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            imgUser.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            lblID.topAnchor.constraint(equalTo: imgUser.topAnchor),
            lblID.bottomAnchor.constraint(equalTo: imgUser.bottomAnchor),
            lblID.leadingAnchor.constraint(equalTo: imgUser.leadingAnchor),
            lblID.trailingAnchor.constraint(equalTo: imgUser.trailingAnchor),
            
            lblName.topAnchor.constraint(equalTo: imgUser.topAnchor),
            lblName.leadingAnchor.constraint(equalTo: imgUser.trailingAnchor, constant: 16),
            lblName.trailingAnchor.constraint(equalTo: lblDate.leadingAnchor, constant: -8),
            
            lblMessage.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 8),
            lblMessage.bottomAnchor.constraint(equalTo: imgUser.bottomAnchor),
            lblMessage.leadingAnchor.constraint(equalTo: lblName.leadingAnchor),
            lblMessage.trailingAnchor.constraint(equalTo: lblName.trailingAnchor),
            
            lblDate.centerYAnchor.constraint(equalTo: lblName.centerYAnchor),
            lblDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
        ])
    }
    
    func config(chat: Chat) {
        let name: String = chat.currentUser.name
        lblName?.text = name
        lblID?.text = firstCharacters(of: name)
        
        if let message: Message = chat.messages.last {
            lblMessage?.text = message.message
            lblDate?.text = message.date.displayDate()
        }
        
    }
    
    private func firstCharacters(of str: String) -> String {
        var capitals: String = ""
        for (index, sub) in str.split(separator: " ").enumerated() {
            if index < 2 {
                capitals = capitals + sub.prefix(1)
            } else {
                break
            }
        }
        return capitals.uppercased()
    }
}
