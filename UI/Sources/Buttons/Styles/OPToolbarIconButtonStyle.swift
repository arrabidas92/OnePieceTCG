//
//  OPToolbarIconButtonStyle.swift
//  UI
//
//  Created by Alexandre DUARTE on 04/04/2025.
//

import SwiftUI

public struct OPToolbarIconButtonStyle: OPIconButtonStyle {
    public init() {}
    
    public func body(content: OPIconButtonStyleContent) -> some View {
        Button(action: content.action) {
            Image(systemName: content.image)
                .foregroundStyle(
                    Color("Content", bundle: .module)
                )
                .font(OPFontType.CTA.regular)
                .frame(width: OPSize.Toolbar.width, height: OPSize.Button.height)
                .accessibilityLabel(content.accessibilityLabel)
        }
    }
}
