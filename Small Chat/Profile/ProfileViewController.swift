//
//  ProfileViewController.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//  
//

import UIKit

class ProfileController: UIViewController {
    weak var viewProfile: ProfileView?

    override func loadView() {
        let viewProfile: ProfileView = ProfileView(controller: self)
        self.viewProfile = viewProfile
        view = viewProfile
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func logout() {
        Session.shared.logout { error in
            if error == nil {
                self.dismiss(animated: true)
            }
        }
    }
}
