//
//  SetCard.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 08/07/2024.
//

import SwiftUI

struct CollectionCardView: View {
    let collection: Collection
    let onCollectionTap: (Collection) -> ()
    
    var body: some View {
        let _ = Self._printChanges()
        HStack(alignment: .center) {
            Text(collection.name)
                .foregroundStyle(collection.nameColor)
                .padding(.horizontal, .md)
                .padding(.vertical, .xl)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(collection.nameColor)
        }
        .padding(.horizontal, .md)
        .frame(maxWidth: .infinity)
        .background(collection.color)
        .clipShape(
            RoundedRectangle(cornerRadius: .md)
        )
        .onTapGesture { onCollectionTap(collection) }
    }
}

#Preview {
    CollectionCardView(collection: .romanceDawn) { collection in
        print(collection)
    }
}
