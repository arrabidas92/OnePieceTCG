//
//  CameraHeader.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 17/03/2025.
//

import SwiftUI

struct CameraHeader: View {
    let title: String
    let onClose: () -> Void
    let onToggleFlash: () -> Void
    let getFlashIcon: () -> String

    var body: some View {
        HStack {
            IconButton(
                imageSystemName: "xmark",
                accessibilityLabel: "Close",
                action: onClose
            )
            Spacer()
            Text(LocalizedStringResource(stringLiteral: title))
            Spacer()
            IconButton(
                imageSystemName: getFlashIcon(),
                accessibilityLabel: "Flash",
                action: onToggleFlash
            )
        }
        .padding(DesignSystem.Spacing.md.rawValue)
        .background { Color(.black).opacity(0.3) }
    }
}

#Preview {
    CameraHeader(
        title: "camera.title",
        onClose: {},
        onToggleFlash: {},
        getFlashIcon: { "bolt" }
    )
}
