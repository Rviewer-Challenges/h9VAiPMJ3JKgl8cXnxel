//
//  Chat.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 09/08/22.
//

import Foundation

struct Chat: Codable {
    var user1: User
    var user2: User
    var messages: [Message]
    
    init(snapshot: [String: AnyObject]) {
        user1 = User(dict: snapshot["user1"] as! [String: AnyObject])
        user2 = User(dict: snapshot["user2"] as! [String: AnyObject])
        messages = []
        for message in snapshot["messages"] as? [[String: AnyObject]] ?? [] {
            messages.append(Message(dict: message))
        }
    }
    
    init(user1: User, user2: User, messages: [Message]) {
        self.user1 = user1
        self.user2 = user2
        self.messages = messages
    }
    
    func toDict() -> [String: AnyObject] {
        
        var msgs: [[String: AnyObject]] = []
        for message in messages {
            msgs.append(message.toDict())
        }
        
        return [
            "user1": user1.toDict() as AnyObject,
            "user2": user2.toDict() as AnyObject,
            "messages": msgs as AnyObject
        ]
    }
    
    var currentUser: User {
        return user1.email == Session.shared.email ? user2 : user1
    }
}

struct User: Codable {
    var email: String
    var name: String
    
    init(email: String, name: String) {
        self.email = email
        self.name = name
    }
    
    init(dict: [String: AnyObject]) {
        self.email = dict["email"] as! String
        self.name = dict["name"] as! String
    }
    
    func toDict() -> [String: AnyObject] {
        return [
            "email": email as AnyObject,
            "name": name as AnyObject
        ]
    }
}

struct Message: Codable {
    var user: String
    var message: String
    var date: String
    
    init(user: String, message: String, date: String) {
        self.user = user
        self.message = message
        self.date = date
    }
    
    init(dict: [String: AnyObject]) {
        self.user = dict["user"] as! String
        self.message = dict["message"] as! String
        self.date = dict["date"] as! String
    }
    
    func toDict() -> [String: AnyObject] {
        return [
            "user": user as AnyObject,
            "message": message as AnyObject,
            "date": date as AnyObject
        ]
    }
}
