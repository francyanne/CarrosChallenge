//
//  SessionManager.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import Foundation

class SessionManager {
    static let shared = SessionManager()
    var userDefaults = UserDefaults.standard
    
    var login: String? {
        set {
            userDefaults.setValue(newValue, forKey: "login")
        }
        get {
            userDefaults.string(forKey: "login")
        }
    }
    
    var password: String? {
        set {
            userDefaults.setValue(newValue, forKey: "pass")
        }
        get {
            userDefaults.string(forKey: "pass")
        }
    }
    
    func clearSession() {
        login = nil
        password = nil
    }
    
    func hasSession() -> Bool {
        if login != nil {
            return true
        } else {
            return false
        }
    }
}
