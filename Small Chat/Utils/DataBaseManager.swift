//
//  DataBaseManager.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import Foundation
import FirebaseDatabase

final class DataBaseManager {
    private init() {
    }
    
    public static let shared: DataBaseManager = DataBaseManager()
    
    let userChats: DatabaseReference = Database.database().reference(withPath: "user-chats")
    
    func test() {
        let user1: User = User(email: Session.shared.email, name: Session.shared.name)
        let user2: User = User(email: "juanjoseen@hotmail.com", name: "Otro Juan")
        let chat: Chat = Chat(user1: user2, user2: user1, messages: [
            Message(user: "juanjoseen@hotmail.com", message: "Hola!!", date: "09/08/2022 12:13:40 p.m."),
            Message(user: "juanjoseen@gmail.com", message: "Hola, como estas?", date: "09/08/2022 12:46:01 p.m.")
        ])
        userChats.setValue([chat.toDict()])
    }
    
    func observeChats(delegate: ChatDelegate) {
        var chats: [Chat] = []
        userChats.observe(.value) { snapshot in
            chats = []
            for list in snapshot.children {
                if let snap: DataSnapshot = list as? DataSnapshot {
                    let chat = Chat(snapshot: snap.value as? [String: AnyObject] ?? [:])
                    chats.append(chat)
                }
            }
            chats = chats.filter({ $0.user1.email == Session.shared.email || $0.user2.email == Session.shared.email })
            delegate.chatsDidChange(chats)
        }
    }
}

protocol ChatDelegate: AnyObject {
    func chatsDidChange(_ chats: [Chat])
}
