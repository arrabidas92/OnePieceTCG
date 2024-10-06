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
        
        ScrollView {
            switch vm.result {
            case .success(let releases):
                LazyVStack(alignment: .leading) {
                    ForEach(releases) { release in
                        CollectionCardView(
                            release: release,
                            isLoading: false
                        ) { release in
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
            case .error(let e):
                EmptyView()
            case .loading:
                //Add loading progress views to fit available screen count number divide by screen height and generate the views
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 16.0)
                        .skeleton(
                            RoundedRectangle(cornerRadius: .md),
                            isLoading: true
                        )
                        .padding(.horizontal, .md)
                        .frame(width: geometry.size.width, height: 64.0)
                        .foregroundColor(.blue)
                        
                    }
            }
        }
        .task { await vm.getReleases() }
        .navigationTitle("Collections")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListCollectionCardView()
}
