//
//  ReleaseViewModel.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 23/08/2024.
//

import SwiftUI
import FirebaseFirestore

@Observable class ReleaseViewModel {
    var releases: [Release] = []
    
    private let db = Firestore.firestore()
}

protocol FirebaseRepository {
    var database: Firestore { get }
}

struct FirebaseRepositoryImpl: FirebaseRepository {
    let database: Firestore
}


public protocol AnyRequestService {
    associatedtype T: DocumentTarget
    func getSingle<Dto: Decodable>(target: T) async -> Result<Dto?, Error>
    func getAll<Dto: Decodable>(target: T) async -> Result<[Dto], Error>
}

public protocol DocumentTarget {
    var reference: String { get }
}

public struct FirestoreRequestService<T: DocumentTarget>: AnyRequestService {
    private let database: Firestore
    
    public init() {
        self.database = Firestore.firestore()
    }
    
    public func getSingle<Dto>(target: T) async -> Result<Dto?, Error> where Dto : Decodable {
        let databaseReference = database.collection(target.reference)
        
        do {
            let snapshot = try await databaseReference.getDocuments()
            let data = try snapshot.documents.map { try $0.data(as: Dto.self) }
            
            if let data = data.first {
                return Result.success(data)
            } else {
                throw RequestServiceError.noData
            }
        } catch let error {
            return Result.failure(error)
        }
    }
    
    public func getAll<Dto>(target: T) async -> Result<[Dto], Error> where Dto : Decodable {
        let databaseReference =  database.collection(target.reference)
        
        do {
            let document = try await databaseReference.getDocuments()
            let data = try document.documents.map { try $0.data(as: Dto.self) }
            return Result.success(data)
        } catch let error {
            return Result.failure(error)
        }
    }
}

enum RequestServiceError: Error {
    case noData
}
