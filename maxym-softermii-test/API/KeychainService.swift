//
//  KeychainService.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import Foundation
import KeychainAccess

class KeychainService {
    private static var keychain: Keychain {
        return Keychain(service: "com.test.maxym-softermii-test")
    }
    private static let userIDKey = "userId"
    private static let tokenKey = "token"
    
    static var userID: String {
        get {
            return keychain[userIDKey] ?? ""
        }
        set {
            keychain[userIDKey] = newValue
        }
    }
    
    static var token: String {
        get {
            return keychain[tokenKey] ?? ""
        }
        set {
            keychain[tokenKey] = newValue
        }
    }
    
    static func clearKeychain() {
        do {
            try keychain.removeAll()
        } catch {
            print(exception())
        }
    }
}
