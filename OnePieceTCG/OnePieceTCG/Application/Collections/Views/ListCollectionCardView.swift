//
//  ListCollectionCard.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 08/07/2024.
//

import SwiftUI
import FirebaseFirestore

struct ListCollectionCardView: View {
    @Environment(RouterImpl.self) private var router
    @State private var vm = ReleaseViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        List {
            ForEach(vm.releases) { release in
                CollectionCardView(release: release) { release in
                    router.navigate(to: .releaseDetails(release))
                }
                .id(release.id)
                .listRowInsets(
                    .init(
                        top: .xs,
                        leading: .md,
                        bottom: .xs,
                        trailing: .md
                    )
                )
            }
        }
        .task { await vm.getReleases() }
        .scrollContentBackground(.hidden)
        .listStyle(
            PlainListStyle()
        )
        .navigationTitle("Collections")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListCollectionCardView()
}
