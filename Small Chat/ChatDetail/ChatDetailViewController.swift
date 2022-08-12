//
//  ChatDetailViewController.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//  
//

import UIKit

class ChatDetailController: UIViewController {
    weak var viewChatDetail: ChatDetailView?
    
    var chat: Chat!
    
    convenience init(chat: Chat) {
        self.init()
        self.chat = chat
    }

    override func loadView() {
        let viewChatDetail: ChatDetailView = ChatDetailView(controller: self)
        self.viewChatDetail = viewChatDetail
        view = viewChatDetail
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = chat.currentUser.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
}
