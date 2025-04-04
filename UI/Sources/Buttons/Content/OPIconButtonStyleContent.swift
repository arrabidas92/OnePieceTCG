//
//  OPIconButtonStyleContent.swift
//  UI
//
//  Created by Alexandre DUARTE on 04/04/2025.
//

import Foundation

public struct OPIconButtonStyleContent {
    let image: String
    let accessibilityLabel: String
    let action: () -> Void
    
    public init(image: String, accessibilityLabel: String, action: @escaping () -> Void) {
        self.image = image
        self.accessibilityLabel = accessibilityLabel
        self.action = action
    }
}
