//
//  MetricType.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 09/07/2024.
//

import Foundation

enum MetricType {
    case releaseDate
    case total
    case owned
}

extension MetricType {
    var imageName: String {
        switch self {
        case .releaseDate:
            return "calendar"
        case .total:
            return "number"
        case .owned:
            return "checkmark"
        }
    }
}
