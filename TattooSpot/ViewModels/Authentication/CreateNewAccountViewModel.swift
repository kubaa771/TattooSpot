//
//  CreateNewAccountViewModel.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 02/11/2024.
//

import Foundation

class CreateNewAccountViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var nickname: String = ""
    
    func createNewAccount() async throws -> Bool {
        do {
            try await AuthenticationNetworkManager.createUser(email: email, password: password, nickname: nickname)
            return true
        } catch {
            print("CreateNewAccountViewModel error: \(error.localizedDescription)")
            return false
        }
    }
}
