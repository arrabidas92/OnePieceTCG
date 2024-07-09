//
//  ListCollectionCard.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 08/07/2024.
//

import SwiftUI

struct ListCollectionCardView: View {
    @Environment(RouterImpl.self) private var router
    
    var body: some View {
        let _ = Self._printChanges()
        List(Collection.allCases) { collection in
            CollectionCardView(collection: collection) { collection in
                router.navigate(to: .collectionDetails(collection))
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
