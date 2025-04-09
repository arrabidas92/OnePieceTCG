//  CameraHeader.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 17/03/2025.
//

import SwiftUI
import UI

public struct CameraHeader: View {
    private let onClose: () -> Void
    private let onToggleFlash: () -> Void
    private let getFlashIcon: () -> String

    public init(
        onClose: @escaping () -> Void,
        onToggleFlash: @escaping () -> Void,
        getFlashIcon: @escaping () -> String
    ) {
        self.onClose = onClose
        self.onToggleFlash = onToggleFlash
        self.getFlashIcon = getFlashIcon
    }
    
    public var body: some View {
        HStack {
            OPIconButton(
                image: "xmark",
                accessibilityLabel: "close",
                action: onClose
            )
            
            Spacer()
            Text("camera.title", bundle: .module)
            Spacer()
            OPIconButton(
                image: getFlashIcon(),
                accessibilityLabel: "flash",
                action: onToggleFlash
            )
        }
        .padding(OPSpacing.md)
        .background { Color(.black).opacity(0.3) }
    }
}
