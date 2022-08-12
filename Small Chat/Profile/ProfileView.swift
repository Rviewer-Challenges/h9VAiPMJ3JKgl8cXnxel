//
//  ProfileView.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//  
//

import UIKit

class ProfileView: UIView {
    unowned var controller: ProfileController!

    init(controller: ProfileController) {
        self.controller = controller
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .bgColor
        
        let btnLogout: UIButton = UIButton.with(title: "Logout", color: .white, backgroundColor: .orange, radius: 8, font: .subtitle())
        btnLogout.addTarget(self, action: #selector(actionLogout), for: .touchUpInside)
        
        addSubview(btnLogout)
        
        NSLayoutConstraint.activate([
            btnLogout.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            btnLogout.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            btnLogout.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            btnLogout.heightAnchor.constraint(equalToConstant: 46),
        ])
    }
    
    @objc func actionLogout() {
        controller.logout()
    }
}
