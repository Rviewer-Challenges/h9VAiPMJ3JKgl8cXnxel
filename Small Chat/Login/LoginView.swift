//
//  LoginView.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 08/08/22.
//  
//

import UIKit

class LoginView: UIView {
    unowned var controller: LoginController!
    
    lazy var bgSignIn: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .bgGray
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 1.0
        return view
    }()
    
    lazy var btnGoogle: UIButton = {
        let buton: UIButton = UIButton.with(backgroundColor: .white, radius: 8)
        
        let imgView: UIImageView = UIImageView(image: UIImage(named: "google"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        
        let label: UILabel = UILabel.with(text: "Continue with Google", font: .text(17), color: .black)
        
        buton.addSubview(imgView)
        buton.addSubview(label)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: buton.topAnchor, constant: 4),
            imgView.bottomAnchor.constraint(equalTo: buton.bottomAnchor, constant: -4),
            imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor),
            imgView.leadingAnchor.constraint(equalTo: buton.leadingAnchor, constant: 32),
            
            label.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
            label.centerYAnchor.constraint(equalTo: buton.centerYAnchor),
        ])
        buton.addTarget(self, action: #selector(actionLoginGoogle), for: .touchUpInside)
        return buton
    }()
    
    lazy var btnFacebook: UIButton = {
        let buton: UIButton = UIButton.with(backgroundColor: .facebook, radius: 8)
        
        let imgView: UIImageView = UIImageView(image: UIImage(named: "facebook"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = .white
        
        let label: UILabel = UILabel.with(text: "Continue with Facebook", font: .text(17), color: .white)
        
        buton.addSubview(imgView)
        buton.addSubview(label)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: buton.topAnchor, constant: 8),
            imgView.bottomAnchor.constraint(equalTo: buton.bottomAnchor, constant: -8),
            imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor),
            imgView.leadingAnchor.constraint(equalTo: buton.leadingAnchor, constant: 32),
            
            label.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 12),
            label.centerYAnchor.constraint(equalTo: buton.centerYAnchor),
        ])
        return buton
    }()
    
    lazy var btnMail: UIButton = {
        let buton: UIButton = UIButton.with(backgroundColor: .bgColor, radius: 8)
        
        let imgView: UIImageView = UIImageView(image: UIImage(systemName: "envelope.fill"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = .textColor
        
        let label: UILabel = UILabel.with(text: "Continue with Mail", font: .text(17), color: .textColor)
        
        buton.addSubview(imgView)
        buton.addSubview(label)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: buton.topAnchor, constant: 8),
            imgView.bottomAnchor.constraint(equalTo: buton.bottomAnchor, constant: -8),
            imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor),
            imgView.leadingAnchor.constraint(equalTo: buton.leadingAnchor, constant: 32),
            
            label.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: buton.centerYAnchor),
        ])
        return buton
    }()

    init(controller: LoginController) {
        self.controller = controller
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .bgBlue
        
        let imgLogo: UIImageView = UIImageView(image: UIImage(named: "logo"))
        imgLogo.translatesAutoresizingMaskIntoConstraints = false
        imgLogo.contentMode = .scaleAspectFit
        
        let lblTitle: UILabel = UILabel.with(text: "Small Chat", font: .largeTitle(35), color: .white, alignment: .center)
        
        let lblWelcome: UILabel = UILabel.with(text: "Welcome to Small Chat", font: .title(20), color: .white, alignment: .center)
        
        let lblDescription: UILabel = UILabel.with(text: "The platform where you can message to your friends in a simple way.\n\n We hope you enjoy it 😉", font: .text(), color: .white, alignment: .justified)
        
        addSubview(imgLogo)
        addSubview(lblTitle)
        addSubview(lblWelcome)
        addSubview(lblDescription)
        addSubview(bgSignIn)
        bgSignIn.addSubview(btnGoogle)
        bgSignIn.addSubview(btnFacebook)
        bgSignIn.addSubview(btnMail)
        
        NSLayoutConstraint.activate([
            
            imgLogo.widthAnchor.constraint(equalToConstant: 180),
            imgLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
            imgLogo.heightAnchor.constraint(equalTo: imgLogo.widthAnchor),
            imgLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            
            lblTitle.topAnchor.constraint(equalTo: imgLogo.bottomAnchor, constant: 12),
            lblTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            lblWelcome.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 24),
            lblWelcome.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            lblDescription.topAnchor.constraint(equalTo: lblWelcome.bottomAnchor, constant: 12),
            lblDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            lblDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            bgSignIn.topAnchor.constraint(equalTo: lblDescription.bottomAnchor, constant: 40),
            bgSignIn.bottomAnchor.constraint(equalTo: bottomAnchor),
            bgSignIn.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgSignIn.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            btnGoogle.topAnchor.constraint(equalTo: bgSignIn.topAnchor, constant: 50),
            btnGoogle.leadingAnchor.constraint(equalTo: bgSignIn.leadingAnchor, constant: 32),
            btnGoogle.trailingAnchor.constraint(equalTo: bgSignIn.trailingAnchor, constant: -32),
            btnGoogle.heightAnchor.constraint(equalToConstant: 46),
            
            btnFacebook.topAnchor.constraint(equalTo: btnGoogle.bottomAnchor, constant: 32),
            btnFacebook.leadingAnchor.constraint(equalTo: btnGoogle.leadingAnchor),
            btnFacebook.trailingAnchor.constraint(equalTo: btnGoogle.trailingAnchor),
            btnFacebook.heightAnchor.constraint(equalTo: btnGoogle.heightAnchor),
            
            btnMail.topAnchor.constraint(equalTo: btnFacebook.bottomAnchor, constant: 32),
            btnMail.leadingAnchor.constraint(equalTo: btnFacebook.leadingAnchor),
            btnMail.trailingAnchor.constraint(equalTo: btnFacebook.trailingAnchor),
            btnMail.heightAnchor.constraint(equalTo: btnFacebook.heightAnchor),
        ])
    }
    
    @objc func actionLoginGoogle() {
        controller.goolgeSignin()
    }
}
