//
//  OPCameraCircleButtonStyle.swift
//  UI
//
//  Created by Alexandre DUARTE on 04/04/2025.
//

import SwiftUI

public struct OPCameraCircleButtonStyle: OPCircleButtonStyle {
    public init() {}
    
    public func body(content: OPCircleButtonStyleContent) -> some View {
        Button(action: content.action) {
            Circle()
                .frame(
                    width: OPSize.CameraButton.height,
                    height: OPSize.CameraButton.height
                )
                .foregroundColor(
                    Color("Content", bundle: .module)
                )
                .overlay(
                    Circle().stroke(
                        Color("Background", bundle: .module),
                        lineWidth: OPStroke.Border.thin
                    )
                )
                .accessibilityLabel(content.accessibilityLabel)
        }
    }
}
