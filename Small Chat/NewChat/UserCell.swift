//
//  UserCell.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import UIKit

class UserCell: UITableViewCell {
    static let identifier: String = "UserCell"
    
    private let imgSize: CGFloat = 60
    
    private weak var imgProfile: UIImageView?
    private weak var lblID: UILabel?
    private weak var lblName: UILabel?
    private weak var lblMail: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .bgColor
        
        let imgProfile: UIImageView = UIImageView()
        imgProfile.translatesAutoresizingMaskIntoConstraints = false
        imgProfile.backgroundColor = .bgGray
        imgProfile.layer.cornerRadius = imgSize / 2.0
        self.imgProfile = imgProfile
        
        let lblID: UILabel = UILabel.with(font: .largeTitle(), alignment: .center)
        self.lblID = lblID
        
        let lblName: UILabel = UILabel.with(font: .subtitle())
        lblName.numberOfLines = 1
        self.lblName = lblName
        
        let lblMail: UILabel = UILabel.with(font: .text(), color: .textColor.withAlphaComponent(0.6))
        lblMail.numberOfLines = 1
        self.lblMail = lblMail
        
        contentView.addSubview(imgProfile)
        contentView.addSubview(lblID)
        contentView.addSubview(lblName)
        contentView.addSubview(lblMail)
        
        NSLayoutConstraint.activate([
            imgProfile.widthAnchor.constraint(equalToConstant: imgSize),
            imgProfile.heightAnchor.constraint(equalTo: imgProfile.widthAnchor),
            imgProfile.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imgProfile.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            imgProfile.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            lblID.topAnchor.constraint(equalTo: imgProfile.topAnchor),
            lblID.bottomAnchor.constraint(equalTo: imgProfile.bottomAnchor),
            lblID.leadingAnchor.constraint(equalTo: imgProfile.leadingAnchor),
            lblID.trailingAnchor.constraint(equalTo: imgProfile.trailingAnchor),
            
            lblName.topAnchor.constraint(equalTo: imgProfile.topAnchor),
            lblName.leadingAnchor.constraint(equalTo: imgProfile.trailingAnchor, constant: 12),
            lblName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            lblMail.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 4),
            lblMail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            lblMail.leadingAnchor.constraint(equalTo: lblName.leadingAnchor),
            lblMail.trailingAnchor.constraint(equalTo: lblName.trailingAnchor),
        ])
    }
    
    func config(with user: User) {
        lblName?.text = user.name
        lblMail?.text = user.email
        lblID?.text = user.name.firstCharacters()
    }
}
