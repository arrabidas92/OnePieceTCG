//
//  CircleButton.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 19/03/2025.
//

import SwiftUI

public struct CircleButton: View {
    public let size: CGFloat
    public let foregroundColor: Color
    public let strokeColor: Color
    public let lineWidth: CGFloat
    public let bottomPadding: CGFloat
    public let accessibilityLabel: String
    public let action: () -> Void
    
    public var body: some View {
        Button(action: action) {
            Circle()
                .frame(width: size, height: size)
                .foregroundColor(foregroundColor)
                .overlay(
                    Circle().stroke(
                        strokeColor,
                        lineWidth: lineWidth
                    )
                )
                .accessibilityLabel(accessibilityLabel)
        }
        .padding(.bottom, bottomPadding)
    }
}

#Preview {
    CircleButton(
        size: 80,
        foregroundColor: Color.white,
        strokeColor: Color.black,
        lineWidth: 3,
        bottomPadding: 30,
        accessibilityLabel: "Custom Circle Button",
        action: {}
    )
}
