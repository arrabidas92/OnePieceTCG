//
//  AnyRequestService.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 04/09/2024.
//

import Foundation

public protocol AnyRequestService {
    associatedtype T: DocumentTarget
    func getSingle<Dto: Decodable>(target: T) async -> Result<Dto, Error>
    func getAll<Dto: Decodable>(target: T) async -> Result<[Dto], Error>
}
