//
//  DataBaseManager.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import Foundation
import FirebaseDatabase

final class DataBaseManager {
    private init() {}
    
    public static let shared: DataBaseManager = DataBaseManager()
    
    private let userChats: DatabaseReference = Database.database().reference(withPath: "user-chats")
    private let users: DatabaseReference = Database.database().reference(withPath: "users")
    
    func test() {
        let user1: User = User(email: Session.shared.email, name: Session.shared.name)
        let user2: User = User(email: "juanjoseen@hotmail.com", name: "Otro Juan")
        let chat: Chat = Chat(user1: user2, user2: user1, messages: [
            Message(user: "juanjoseen@hotmail.com", message: "Hola!!", date: "09/08/2022 12:13:40 p.m."),
            Message(user: "juanjoseen@gmail.com", message: "Hola, como estas?", date: "09/08/2022 12:46:01 p.m.")
        ])
        userChats.setValue([chat.toDict()])
    }
    
    // MARK: - Users
    func insertUser(email: String, name: String) {
        Session.shared.email = email
        Session.shared.name = name
        users.observeSingleEvent(of: .value) { snapshot in
            let newUser: [String: String] = [
                "email": email,
                "name": name
            ]
            if var usersCollection: [[String: String]] = snapshot.value as? [[String: String]] {    // <- User Collection Exists
                var found: Bool = false
                for user in usersCollection {
                    if user["email"] == email {
                        found = true
                        break
                    }
                }
                if !found {
                    usersCollection.append(newUser)
                    self.users.setValue(usersCollection)
                }
            } else {    // <- User Collection doesn't exists
                self.users.setValue([newUser])
            }
        }
    }
    
    func getAllUsers(completion: @escaping ([User], DatabaseError?) -> Void) {
        users.observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [[String: AnyObject]] else {
                completion([], .failedFetchUsers)
                return
            }
            var list: [User] = []
            for dict in value {
                list.append(User(dict: dict))
            }
            completion(list, nil)
        }
    }
    
    // MARK: - Chats
    
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

enum DatabaseError: Error {
    case failedFetchUsers
    
    var localizedDescription: String {
        switch self {
        case .failedFetchUsers:
            return "Error Fetching Users from database"
        }
    }
}
