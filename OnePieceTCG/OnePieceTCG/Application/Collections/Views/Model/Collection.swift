//
//  Collection.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 08/07/2024.
//

import FirebaseFirestore

struct Release: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let name: String
    let color: String
    let nameColor: String
    let releaseDate: Date
    let totalOfCards: Int
}
