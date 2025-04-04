//
//  OPCircleButton.swift
//  UI
//
//  Created by Alexandre DUARTE on 04/04/2025.
//

import SwiftUI

public struct OPCircleButton<Style: OPCircleButtonStyle>: View {
    let accessibilityLabel: String
    let action: () -> Void
    let style: Style

    public init(
        accessibilityLabel: String,
        action: @escaping () -> Void,
        style: Style = OPCameraCircleButtonStyle()
    ) {
        self.accessibilityLabel = accessibilityLabel
        self.action = action
        self.style = style
    }

    public var body: some View {
        style.body(
            content: OPCircleButtonStyleContent(
                accessibilityLabel: accessibilityLabel,
                action: action
            )
        )
    }
}

public extension OPCircleButton {
    func buttonStyle<S: OPCircleButtonStyle>(_ style: S) -> OPCircleButton<S> {
        OPCircleButton<S>(accessibilityLabel: accessibilityLabel, action: action, style: style)
    }
}
