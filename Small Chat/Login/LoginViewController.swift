//
//  LoginViewController.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 08/08/22.
//  
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn


class LoginController: UIViewController {
    weak var viewLogin: LoginView?

    override func loadView() {
        let viewLogin: LoginView = LoginView(controller: self)
        self.viewLogin = viewLogin
        view = viewLogin
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func goolgeSignin() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)

        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let auth = user?.authentication, let idToken = auth.idToken else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: auth.accessToken)

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                } else {
                    let email: String = authResult?.user.email ?? ""
                    let name: String = authResult?.user.displayName ?? ""
                    DataBaseManager.shared.insertUser(email: email, name: name)
                }
            }
            self.dismiss(animated: true)
        }
    }
}
