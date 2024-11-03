//
//  AuthenticationNetworkManager.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 02/11/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthenticationNetworkManager {
    
    static func createUser(email: String, password: String, nickname: String) async throws {
        do {
            let authUser = try await Auth.auth().createUser(withEmail: email, password: password).user
            let user = User(uid: authUser.uid, email: email, nickname: nickname)
            try Firestore.firestore().collection("users").document(authUser.uid).setData(from: user)
        } catch {
            print("error while creating user account: \(error.localizedDescription)")
        }
    }
    
    static func signIn(email: String, password: String) async throws -> String {
        return try await Auth.auth().signIn(withEmail: email, password: password).user.uid
    }
    
    static func fetchCurrentUserData(uid: String) async throws -> User {
        return try await Firestore.firestore().collection("users").document(uid).getDocument().data(as: User.self)
    }
}
