//
//  OPCameraNavigationBarContent.swift
//  UI
//
//  Created by Alexandre DUARTE on 16/04/2025.
//

import SwiftUI

public struct OPCameraNavigationBarContent {
    let leftImage: String
    let leftAccessibilityLabel: String
    let leftAction: () -> Void
    let title: String
    let rightImage: String
    let rightAccessibilityLabel: String
    let rightAction: () -> Void
    
    public init(
        leftImage: String,
        leftAccessibilityLabel: String,
        leftAction: @escaping () -> Void,
        title: String,
        rightImage: String,
        rightAccessibilityLabel: String,
        rightAction: @escaping () -> Void
    ) {
        self.leftImage = leftImage
        self.leftAccessibilityLabel = leftAccessibilityLabel
        self.leftAction = leftAction
        self.title = title
        self.rightImage = rightImage
        self.rightAccessibilityLabel = rightAccessibilityLabel
        self.rightAction = rightAction
    }
}

protocol OPCameraNavigationBarStyle: OPViewStyle where Content == OPCameraNavigationBarContent {}

public struct OPCameraNavigationBarStyledContent<Style: OPCameraNavigationBarStyle>: View {
    let content: OPCameraNavigationBarContent
    let style: Style

    var body: some View {
        style.body(content: content)
    }
}

public struct OPCameraPreviewNavigationBarStyle: OPCameraNavigationBarStyle {
    public init() {}
    
    func body(content: OPCameraNavigationBarContent) -> some View {
        HStack {
            Button(action: content.leftAction) {
                Image(systemName: content.leftImage)
                    .foregroundStyle(
                        Color("Content", bundle: .module)
                    )
                    .font(OPFontType.CTA.regular)
                    .frame(width: OPSize.Toolbar.width, height: OPSize.Button.height)
                    .accessibilityLabel(content.leftAccessibilityLabel)
            }
            Spacer()
            Text(content.title, bundle: .module)
            Spacer()
            Button(action: content.rightAction) {
                Image(systemName: content.rightImage)
                    .foregroundStyle(
                        Color("Content", bundle: .module)
                    )
                    .font(OPFontType.CTA.regular)
                    .frame(width: OPSize.Toolbar.width, height: OPSize.Button.height)
                    .accessibilityLabel(content.rightAccessibilityLabel)
            }
        }
        .padding(OPSpacing.md)
        .background { Color(.black).opacity(0.3) }
    }
}
