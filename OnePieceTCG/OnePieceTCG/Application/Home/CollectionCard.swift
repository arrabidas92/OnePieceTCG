//
//  SetCard.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 08/07/2024.
//

import SwiftUI

struct CollectionCard: View {
    let collection: Collection

    var body: some View {
        ZStack(alignment: .center) {
            Text(collection.name)
                .foregroundStyle(collection.nameColor)
                .padding(.horizontal, .md)
                .padding(.vertical, .xl)
        }
        .frame(maxWidth: .infinity)
        .background(collection.color)
        .clipShape(
            RoundedRectangle(cornerRadius: .md)
        )
        .padding(.horizontal, .md)
    }
}

#Preview {
    CollectionCard(collection: .romanceDawn)
}
