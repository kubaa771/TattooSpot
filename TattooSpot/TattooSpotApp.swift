//
//  TattooSpotApp.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 10/10/2024.
//

import SwiftUI
import SwiftData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct TattooSpotApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var router = Router()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                Group {
                    switch router.currentRoot {
                    case .login:
                        LoginView()
                    case .home:
                        MainTabView()
                    default:
                        LoginView()
                    }
                }
                .navigationDestination(for: Destination.self) { destination in
                    router.choosePathFor(destination: destination)
                }
            }
            .environmentObject(router)
        }
        .modelContainer(sharedModelContainer)
    }
}
