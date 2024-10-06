//
//  FirestoreRequestService.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 04/09/2024.
//

import FirebaseFirestore

public struct FirestoreRequestService<T: DocumentTarget>: AnyRequestService {
    private let database: Firestore
    
    public init() {
        self.database = Firestore.firestore()
    }
    
    public func getSingle<Dto>(target: T) async -> ResultState<Dto, Error> where Dto : Decodable {
        let databaseReference = database.collection(target.reference)
        
        do {
            let snapshot = try await databaseReference.getDocuments()
            let data = try snapshot.documents.map { try $0.data(as: Dto.self) }
            
            if let data = data.first {
                return ResultState.success(data)
            } else {
                throw RequestServiceError.noData
            }
        } catch let error {
            return ResultState.error(error)
        }
    }
    
    public func getAll<Dto>(target: T) async -> ResultState<[Dto], Error> where Dto : Decodable {
        let databaseReference =  database.collection(target.reference)
        
        do {
            let document = try await databaseReference.getDocuments()
            let data = try document.documents.map { try $0.data(as: Dto.self) }
            return ResultState.success(data)
        } catch let error {
            return ResultState.error(error)
        }
    }
}
