//
//  TabsController.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import UIKit

class TabsController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .bgColor
        self.delegate = self
        
        let chatVC: ChatController = ChatController()
        let chatItem: UITabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"))
        chatVC.tabBarItem = chatItem
        
        let navVC: UINavigationController = UINavigationController(rootViewController: chatVC)
        
        let profileVC: ProfileController = ProfileController()
        let profileItem: UITabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        profileVC.tabBarItem = profileItem
        
        self.viewControllers = [navVC, profileVC]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.backgroundColor = .bgGray
    }
}

extension TabsController: UITabBarControllerDelegate {
    
}
