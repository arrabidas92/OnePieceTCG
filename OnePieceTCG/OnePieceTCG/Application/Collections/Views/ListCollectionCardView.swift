//
//  ListCollectionCard.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 08/07/2024.
//

import SwiftUI
import FirebaseFirestore

struct ListCollectionCardView: View {
    @State private var vm = ReleaseViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        
        
        ScrollView {
            switch vm.result {
            case .success(let releases):
                ListReleasesView(releases: releases)
            case .error(let e):
                ListReleasesErrorView()
            case .loading:
                ListReleasesProgressView()
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
