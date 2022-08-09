//
//  ViewController.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 08/08/22.
//

import UIKit
//import FirebaseCore
//import FirebaseAuth
//import GoogleSignIn

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Session.shared.isSignedIn {
            let chatVC: ChatController = ChatController()
            let navVC: UINavigationController = UINavigationController(rootViewController: chatVC)
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .crossDissolve
//            navVC.navigationBar.isHidden = true
            present(navVC, animated: true)
        } else {
            let loginVC: LoginController = LoginController()
            let navVC: UINavigationController = UINavigationController(rootViewController: loginVC)
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .crossDissolve
            navVC.navigationBar.isHidden = true
            present(navVC, animated: true)
        }
    }
    
//    @IBAction func googleLogin(_ sender: Any) {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//        let config = GIDConfiguration(clientID: clientID)
//
//        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
//            if let error = error {
//                return
//            }
//
//            guard let auth = user?.authentication, let idToken = auth.idToken else { return }
//
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: auth.accessToken)
//
//            Auth.auth().signIn(with: credential) { authResult, error in
//                if let error = error {
//                    print("error: \(error.localizedDescription)")
//                } else {
//                    print("Email: \(authResult?.user.email)")
//                    print("Token: \(authResult?.user.refreshToken)")
//                }
//            }
//        }
//    }
}

