//
//  Router.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 10/10/2024.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    @Published var currentRoot: Destination = .home
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
    
    func changeRoot(to destination: Destination) {
        path = NavigationPath()
        currentRoot = destination
    }
    
    @ViewBuilder
    func choosePathFor(destination: Destination) -> some View {
        switch destination {
        case .login:
            LoginView()
        case .createNewAccount:
            CreateNewAccountView()
        case .home:
            MainTabView()
        case .artistProfile:
            Text("Artist Profile")
        }
    }
}
