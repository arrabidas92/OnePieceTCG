//
//  OPIconButtonStyleContent.swift
//  UI
//
//  Created by Alexandre DUARTE on 04/04/2025.
//

import Foundation

public struct OPCircleButtonStyleContent {
    let accessibilityLabel: String
    let action: () -> Void
    
    public init(accessibilityLabel: String, action: @escaping () -> Void) {
        self.accessibilityLabel = accessibilityLabel
        self.action = action
    }
}
