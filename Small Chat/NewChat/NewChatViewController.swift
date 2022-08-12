//
//  NewChatViewController.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//  
//

import UIKit

class NewChatController: UIViewController {
    weak var viewNewChat: NewChatView?
    
    var users: [User] = [] {
        didSet {
            viewNewChat?.tableView.reloadData()
        }
    }

    override func loadView() {
        let viewNewChat: NewChatView = NewChatView(controller: self)
        self.viewNewChat = viewNewChat
        view = viewNewChat
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "New Chat"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        fetchUsers()
    }
    
    private func fetchUsers() {
        DataBaseManager.shared.getAllUsers { users, error in
            guard error == nil else {
                print("Error: \(error!.localizedDescription)")
                return
            }
            self.users = users
//            self.users = users.filter({ $0.name.hasPrefix(filter) ||$0.email.hasPrefix(filter) })
        }
    }
}
