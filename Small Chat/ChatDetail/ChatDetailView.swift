//
//  ChatDetailView.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//  
//

import UIKit

class ChatDetailView: UIView {
    unowned var controller: ChatDetailController!

    lazy var tableView: UITableView = {
        let table: UITableView = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .bgColor
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.register(MessageCell.self, forCellReuseIdentifier: MessageCell.identifier)
        table.register(OwnMessageCell.self, forCellReuseIdentifier: OwnMessageCell.identifier)
        return table
    }()
    
    init(controller: ChatDetailController) {
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
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension ChatDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func messageAt(indexPath: IndexPath) -> Message {
        return controller.chat.messages[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.chat.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message: Message = messageAt(indexPath: indexPath)
        if message.user == Session.shared.email {
            let cell: OwnMessageCell = tableView.dequeueReusableCell(withIdentifier: OwnMessageCell.identifier, for: indexPath) as! OwnMessageCell
            cell.config(with: message)
            return cell
        } else {
            let cell: MessageCell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as! MessageCell
            cell.config(with: message)
            return cell
        }
    }
}
