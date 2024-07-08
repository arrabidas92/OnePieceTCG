//
//  ListCollectionCard.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 08/07/2024.
//

import SwiftUI
//TODO: Fix issue list layout
struct ListCollectionCard: View {
    var body: some View {
        List(Collection.allCases) { collection in
            CollectionCard(collection: collection)
        }
    }
}

#Preview {
    ListCollectionCard()
}
