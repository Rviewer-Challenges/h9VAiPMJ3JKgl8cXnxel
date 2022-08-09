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
    
//    let ref: DatabaseReference = DataBaseManager.shared.userChats
//    var refObservers: [DatabaseHandle] = []

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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        DataBaseManager.shared.observeChats(delegate: self)
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
