//
//  ReleaseViewModel.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 23/08/2024.
//

import SwiftUI
import FirebaseFirestore

public enum ResultState<T, E: Error> {
    case success(T)
    case error(E)
    case loading
}

@Observable class ReleaseViewModel {
    var result: ResultState<[Release], Error>
    
    private let repository: ReleaseRepository
    
    init(repository: ReleaseRepository = ReleaseRepositoryImpl(service: .init())) {
        self.repository = repository
        self.result = .loading
    }
    
    func getReleases() async {
        result = .error(RequestServiceError.noData)//await repository.getReleases()
    }
}
