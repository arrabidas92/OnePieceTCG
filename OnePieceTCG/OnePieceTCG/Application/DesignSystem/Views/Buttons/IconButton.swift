//
//  CloseButtonView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 11/03/2025.
//

import SwiftUI

struct IconButton: View {
    let imageSystemName: String
    let accessibilityLabel: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: imageSystemName)
                .foregroundColor(Color(.label))
                .font(.system(size: DesignSystem.FontSize.twentyTwo.rawValue))
                .frame(width: DesignSystem.FrameSize.fourtyFour.rawValue, height: DesignSystem.FrameSize.fourtyFour.rawValue)
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
