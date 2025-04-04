//
//  OPIconButton.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 11/03/2025.
//

import SwiftUI

public struct OPIconButton<Style: OPIconButtonStyle>: View {
    let image: String
    let accessibilityLabel: String
    let action: () -> Void
    let style: Style

    public init(
        image: String,
        accessibilityLabel: String,
        action: @escaping () -> Void,
        style: Style = OPToolbarIconButtonStyle()
    ) {
        self.image = image
        self.accessibilityLabel = accessibilityLabel
        self.action = action
        self.style = style
    }

    public var body: some View {
        style.body(
            content: OPIconButtonStyleContent(
                image: image,
                accessibilityLabel: accessibilityLabel,
                action: action
            )
        )
    }
}

public extension OPIconButton {
    func buttonStyle<S: OPIconButtonStyle>(_ style: S) -> OPIconButton<S> {
        OPIconButton<S>(image: image, accessibilityLabel: accessibilityLabel, action: action, style: style)
    }
}
