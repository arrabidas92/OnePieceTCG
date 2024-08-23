//
//  OnePieceTCGApp.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 31/05/2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct OnePieceTCGApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var router = RouterImpl()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                ListCollectionCardView()
                    .navigationDestination(for: Route.self) { navigate(to: $0) }
                    .environment(router)
            }
            .tint(Color.black)
        }
    }
    
    @ViewBuilder
    private func navigate(to route: Route) -> some View {
        switch route {
        case .releaseDetails(let release):
            EmptyView()
            //CollectionDetailsView(collection: collection)
        }
    }
}
