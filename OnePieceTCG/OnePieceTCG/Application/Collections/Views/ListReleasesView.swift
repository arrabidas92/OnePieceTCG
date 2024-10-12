//
//  ListReleasesView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 12/10/2024.
//

import SwiftUI

struct ListReleasesView: View {
    @Environment(RouterImpl.self) private var router
    let releases: [Release]
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(releases) { release in
                CollectionCardView(release: release) { release in
                    router.navigate(to: .releaseDetails(release))
                }
                .id(release.id)
                .padding(
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
}

#Preview {
    ListReleasesView(releases: [
        .init(
            id: "OP01",
            name: "OP01 - Romance Dawn",
            color: "romanceDawn",
            nameColor: "white",
            releaseDate: Date(),
            totalOfCards: 154
        )
    ])
}
