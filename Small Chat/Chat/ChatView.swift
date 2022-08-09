//
//  ChatView.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 08/08/22.
//  
//

import UIKit

class ChatView: UIView {
    unowned var controller: ChatController!

    lazy var btnLogout: UIButton = {
        let button: UIButton = UIButton.with(title: "Logout", color: .white, backgroundColor: .orange, radius: 8, font: .systemFont(ofSize: 17))
        button.addTarget(self, action: #selector(actionLogout), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let table: UITableView = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .bgColor
        table.delegate = self
        table.dataSource = self
        table.register(ChatCell.self, forCellReuseIdentifier: ChatCell.identifier)
        return table
    }()
    
    init(controller: ChatController) {
        self.controller = controller
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .bgColor
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc func actionLogout() {
        Session.shared.logout { error in
            if let error = error {
                print("Error: \(error)")
            } else {
                self.controller.dismiss(animated: true)
            }
        }
    }
}

extension ChatView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ChatCell = tableView.dequeueReusableCell(withIdentifier: ChatCell.identifier, for: indexPath) as! ChatCell
        let chat: Chat = controller.chats[indexPath.row]
        cell.config(chat: chat)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let chat: Chat = controller.chats[indexPath.row]
        controller.goToChat(chat)
    }
}
