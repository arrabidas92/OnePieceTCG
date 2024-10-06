//
//  ReleaseRepository.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 04/09/2024.
//

import Foundation

public protocol ReleaseRepository {
    func getReleases() async -> ResultState<[Release], Error>
    func getRelease(id: String) async -> ResultState<Release, Error>
}
