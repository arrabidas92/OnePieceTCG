//
//  CollectionDetailsView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 09/07/2024.
//

import SwiftUI

struct CollectionDetailsView: View {
    let collection: Collection
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        let _ = Self._printChanges()
        ScrollView {
            MetricsHeaderView(collection: collection)
                .padding(.horizontal, .md)
                .navigationTitle(collection.shortName)
            LazyVGrid(columns: columns, spacing: .sm) {
                CardView()
                CardView()
            }
            .padding(.vertical, .sm)
            .padding(.horizontal, .md)
        }
    }
}

#Preview {
    CollectionDetailsView(collection: .romanceDawn)
}
