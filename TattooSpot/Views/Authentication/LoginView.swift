//
//  LoginView.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 10/10/2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            userLoginTextView
            userPasswordTextView
            Spacer()
            createAccountView
            loginButtonView
        }
        .padding()
    }
    
    var userLoginTextView: some View {
        TextField(text: $viewModel.login) {
            Text("Login:")
        }
    }
    
    var userPasswordTextView: some View {
        SecureField(text: $viewModel.password) {
            Text("Password:")
        }
    }
    
    var createAccountView: some View {
        Button {
            router.navigate(to: .createNewAccount)
        } label: {
            Text("Create New Account")
        }
    }
    
    var loginButtonView: some View {
        Button {
            Task.init {
                let success = try await viewModel.signIn()
                if success {
                    router.changeRoot(to: .home)
                }
            }
        } label: {
            Text("Login")
        }
    }
}

#Preview {
    LoginView()
}
