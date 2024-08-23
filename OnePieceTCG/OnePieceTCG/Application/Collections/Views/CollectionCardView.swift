//
//  SetCard.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 08/07/2024.
//

import SwiftUI

struct CollectionCardView: View {
    let release: Release
    let onCollectionTap: (Release) -> ()
    
    var body: some View {
        let _ = Self._printChanges()
        HStack(alignment: .center) {
            Text(release.name)
                .foregroundStyle(
                    release.nameColor.colorAsset
                )
                .padding(.horizontal, .md)
                .padding(.vertical, .xl)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(
                    release.nameColor.colorAsset
                )
        }
        .padding(.horizontal, .md)
        .frame(maxWidth: .infinity)
        .background(release.color.colorAsset)
        .clipShape(
            RoundedRectangle(cornerRadius: .md)
        )
        .onTapGesture { onCollectionTap(release) }
    }
}

#Preview {
    CollectionCardView(
        release: .init(
            id: "OP01",
            name: "OP01 - Romance Dawn",
            color: "romanceDawn",
            nameColor: "white",
            releaseDate: Date(),
            totalOfCards: 154
        )
    ) { print($0) }
}
