//
//  LoginViewModel.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 10/10/2024.
//

import Combine

class LoginViewModel: ObservableObject {
    @Published var login: String = ""
    @Published var password: String = ""
    
    func signIn() async throws -> Bool {
        do {
            let userId = try await AuthenticationNetworkManager.signIn(email: login, password: password)
            let user = try await AuthenticationNetworkManager.fetchCurrentUserData(uid: userId)
            UserManager.shared.saveUserSession(with: user)
            return true
        } catch {
            print("LoginViewModel: \(error.localizedDescription)")
            return false
        }
    }
}
