//
//  ChatViewController.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 08/08/22.
//  
//

import UIKit
import FirebaseDatabase

class ChatController: UIViewController {
    weak var viewChat: ChatView?
    
    var chats: [Chat] = [] {
        didSet {
            viewChat?.tableView.reloadData()
        }
    }

    override func loadView() {
        let viewChat: ChatView = ChatView(controller: self)
        self.viewChat = viewChat
        view = viewChat
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Chats"
//        DataBaseManager.shared.test()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(actionNewMessage))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.tabBar.isHidden = false
        
        DataBaseManager.shared.observeChats(delegate: self)
    }
    
    @objc func actionNewMessage() {
        let newChatVC: NewChatController = NewChatController()
        navigationController?.pushViewController(newChatVC, animated: true)
    }
    
    func goToChat(_ chat: Chat) {
        let detailVC: ChatDetailController = ChatDetailController(chat: chat)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ChatController: ChatDelegate {
    func chatsDidChange(_ chats: [Chat]) {
        self.chats = chats
    }
}
