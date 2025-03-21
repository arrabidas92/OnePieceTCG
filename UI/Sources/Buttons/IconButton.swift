//
//  CloseButtonView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 11/03/2025.
//

import SwiftUI

public struct IconButton: View {
    let imageSystemName: String
    let accessibilityLabel: String
    let action: () -> Void

    public init(
        imageSystemName: String,
        accessibilityLabel: String,
        action: @escaping () -> Void
    ) {
        self.imageSystemName = imageSystemName
        self.accessibilityLabel = accessibilityLabel
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Image(systemName: imageSystemName)
                .foregroundColor(Color(.label))
                .font(.system(size: Spacing.md))
                .frame(width: Spacing.xxxl, height: Size.Button.height)
                .accessibilityLabel(accessibilityLabel)
        }
    }
}

#Preview {
    IconButton(
        imageSystemName: "xmark",
        accessibilityLabel: "Close",
        action: {}
    )
}
