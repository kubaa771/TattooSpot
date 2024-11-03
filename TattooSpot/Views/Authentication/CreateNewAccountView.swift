//
//  CreateNewAccountView.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 10/10/2024.
//

import SwiftUI

struct CreateNewAccountView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel = CreateNewAccountViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            userLoginTextView
            userNicknameTextView
            userPasswordTextView
            Spacer()
            createAccountView
        }
        .padding()
    }
    
    var userLoginTextView: some View {
        TextField(text: $viewModel.email) {
            Text("Email:")
        }
    }
    
    var userNicknameTextView: some View {
        TextField(text: $viewModel.nickname) {
            Text("Nickname:")
        }
    }
    
    var userPasswordTextView: some View {
        SecureField(text: $viewModel.password) {
            Text("Password:")
        }
    }
    
    var createAccountView: some View {
        Button {
            Task.init {
                let success = try await viewModel.createNewAccount()
                if success {
                    router.navigateBack()
                } else {
                    // display error message
                }
            }
        } label: {
            Text("Create New Account")
        }
    }
}

#Preview {
    CreateNewAccountView()
}
