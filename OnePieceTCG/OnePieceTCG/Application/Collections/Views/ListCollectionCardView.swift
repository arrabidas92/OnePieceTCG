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
    @FirestoreQuery(collectionPath: "releases") private var releases: Result<[Release], Error>
    
    var body: some View {
        let _ = Self._printChanges()
        List {
            if case let .success(releases) = releases {
                ForEach(releases) { release in
                    CollectionCardView(release: release) { release in
                        router.navigate(to: .releaseDetails(release))
                    }
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
        }
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
