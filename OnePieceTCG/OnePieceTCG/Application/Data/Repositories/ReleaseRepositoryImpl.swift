//
//  ReleaseRepositoryImpl.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 04/09/2024.
//

import Foundation

public struct ReleaseRepositoryImpl: ReleaseRepository {
    private let service: FirestoreRequestService<ReleaseTarget>
    
    public init(service: FirestoreRequestService<ReleaseTarget>) {
        self.service = service
    }
    
    public func getReleases() async -> Result<[Release], Error> {
        return await service.getAll(target: .getReleases)
    }
    
    public func getRelease(id: String) async -> Result<Release, Error> {
        return await service.getSingle(target: .getRelease(id))
    }
}
