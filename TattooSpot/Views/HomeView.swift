//
//  HomeView.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 10/10/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ScrollView {
                ForEach(1...15, id: \.self) { index in
                    HomeArtistHighlightView()
                        .padding([.trailing, .leading, .top])
                }
            }
            .toolbar {
                if !UserManager.shared.isLoggedIn() {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            router.navigate(to: .login)
                        } label: {
                            Text("Sign In")
                        }
                    }
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                router.choosePathFor(destination: destination)
            }
        }
    }
}

#Preview {
    HomeView()
}
