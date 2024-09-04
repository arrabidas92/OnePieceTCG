//
//  ReleaseTarget.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 04/09/2024.
//

import Foundation

public enum ReleaseTarget: DocumentTarget {
    case getReleases
    case getRelease(String)
    
    public var reference: String {
        switch self {
        case .getReleases:
            return "releases"
        case .getRelease(let release):
            return "releases/\(release)"
        }
    }
}
