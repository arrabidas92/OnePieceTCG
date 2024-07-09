//
//  OnePieceTCGApp.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 31/05/2024.
//

import SwiftUI

@main
struct OnePieceTCGApp: App {
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
        case .collectionDetails(let collection):
            CollectionDetailsView(collection: collection)
        }
    }
}


