//
//  CollectionDetailsView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 09/07/2024.
//

import SwiftUI

struct CollectionDetailsView: View {
    let collection: Collection
    
    var body: some View {
        let _ = Self._printChanges()
        ScrollView {
            MetricsHeaderView(collection: collection)
                .padding(.horizontal, .md)
                .navigationTitle(collection.shortName)
        }
    }
}

#Preview {
    CollectionDetailsView(collection: .romanceDawn)
}
