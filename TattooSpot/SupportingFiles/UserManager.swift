//
//  UserManager.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 02/11/2024.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    var currentUser: User?
    
    func saveUserSession(with user: User) {
        self.currentUser = user
    }
    
    func isLoggedIn() -> Bool {
        return currentUser != nil
    }
}
