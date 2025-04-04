//  CameraHeader.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 17/03/2025.
//

import SwiftUI
import UI

public struct CameraHeader: View {
    private let title: String
    private let onClose: () -> Void
    private let onToggleFlash: () -> Void
    private let getFlashIcon: () -> String

    public init(
        title: String,
        onClose: @escaping () -> Void,
        onToggleFlash: @escaping () -> Void,
        getFlashIcon: @escaping () -> String
    ) {
        self.title = title
        self.onClose = onClose
        self.onToggleFlash = onToggleFlash
        self.getFlashIcon = getFlashIcon
    }
    
    public var body: some View {
        HStack {
            OPIconButton(
                image: "xmark",
                accessibilityLabel: "Close",
                action: onClose
            )
            
            Spacer()
            Text(LocalizedStringResource(stringLiteral: title))
            Spacer()
            OPIconButton(
                image: getFlashIcon(),
                accessibilityLabel: "Flash",
                action: onToggleFlash
            )
        }
        .padding(OPSpacing.md)
        .background { Color(.black).opacity(0.3) }
    }
}
