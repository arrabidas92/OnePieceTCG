//
//  ReleaseViewModel.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 23/08/2024.
//

import SwiftUI
import FirebaseFirestore

@Observable class ReleaseViewModel {
    var releases: [Release]
    var isLoading: Bool
    
    private let repository: ReleaseRepository
    
    init(repository: ReleaseRepository = ReleaseRepositoryImpl(service: .init())) {
        self.repository = repository
        self.releases = []
        self.isLoading = true
    }
    
    func getReleases() async {
        let result = await repository.getReleases()
        isLoading = false
        
        switch result {
        case .success(let releases):
            self.releases = releases
        case .failure(let failure):
            self.releases = []
            //TODO: Implement error screen
        }
    }
}
