//
//  Session.swift
//  Small Chat
//
//  Created by Juan Jose Elias Navarro on 08/08/22.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

class Session {
    
    private init() {}
    
    private let defaults: UserDefaults = .standard
    private let kMail: String = "com.SmallChat.Keys.mail"
    private let kName: String = "com.SmallChat.Keys.name"
    
    public static let shared: Session = Session()
    
    
    var email: String {
        get {
            return defaults.value(forKey: kMail) as? String ?? ""
        }
        set {
            defaults.set(newValue, forKey: kMail)
            defaults.synchronize()
        }
    }
    
    var name: String {
        get {
            return defaults.value(forKey: kName) as? String ?? ""
        }
        set {
            defaults.set(newValue, forKey: kName)
            defaults.synchronize()
        }
    }
    
    var isSignedIn: Bool {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn()
            if let email = GIDSignIn.sharedInstance.currentUser?.profile?.email, !email.isEmpty {
                self.email = email
            }
            if let name = GIDSignIn.sharedInstance.currentUser?.profile?.name, !name.isEmpty {
                self.name = name
            }
            return true
        }
        return false
    }
    
    func logout(completion: @escaping (Error?) -> Void) {
        GIDSignIn.sharedInstance.signOut()
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch {
            print("Error signing out!!!")
            completion(error)
        }
    }
}
