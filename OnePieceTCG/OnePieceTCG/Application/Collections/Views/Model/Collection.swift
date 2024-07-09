//
//  Collection.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 08/07/2024.
//

import SwiftUI

enum Collection: CaseIterable {
    case romanceDawn
    case paramountWar
}

extension Collection: Identifiable {
    var id: Int { hashValue }
}

extension Collection {
    var name: String {
        switch self {
        case .romanceDawn:
            return "OP01 - Romance Dawn"
        case .paramountWar:
            return "OP02 - Paramount War"
        }
    }
    
    var shortName: String {
        switch self {
        case .romanceDawn:
            return "OP01"
        case .paramountWar:
            return "OP02"
        }
    }
    
    var nameColor: Color {
        switch self {
        case .romanceDawn, .paramountWar:
            return Color.white
        }
    }
    
    var color: Color {
        switch self {
        case .romanceDawn:
            return Color.romanceDawn
        case .paramountWar:
            return Color.paramountWar
        }
    }
    
    var releaseDate: String {
        switch self {
        case .romanceDawn:
            return "02/12/2022"
        case .paramountWar:
            return "10/03/2023"
        }
    }
    
    var totalOfCards: String {
        switch self {
        case .romanceDawn, .paramountWar:
            return "154 CARTES"
        }
    }
}
