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
    let title: LocalizedStringKey
    let rightImage: String
    let rightAccessibilityLabel: String
    let rightAction: () -> Void
    
    public init(
        leftImage: String,
        leftAccessibilityLabel: String,
        leftAction: @escaping () -> Void,
        title: LocalizedStringKey,
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

public protocol OPCameraNavigationBarStyle: OPViewStyle where Content == OPCameraNavigationBarContent {}

public struct OPCameraNavigationBar<Style: OPCameraNavigationBarStyle>: View {
    let content: OPCameraNavigationBarContent
    let style: Style

    public init(content: OPCameraNavigationBarContent, style: Style) {
        self.content = content
        self.style = style
    }
    
    public var body: some View {
        style.body(content: content)
    }
}

public struct OPCameraPreviewNavigationBarStyle: OPCameraNavigationBarStyle {
    public init() {}
    
    public func body(content: OPCameraNavigationBarContent) -> some View {
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
                .font(OPFontType.CTA.regular)
            
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

public struct OPCameraCapturedNavigationBarStyle: OPCameraNavigationBarStyle {
    public init() {}
    
    public func body(content: OPCameraNavigationBarContent) -> some View {
        HStack {
            Button(action: content.leftAction) {
                Text(
                    LocalizedStringKey(stringLiteral: content.leftImage),
                    bundle: .module
                )
                .foregroundStyle(Color("Content", bundle: .module))
                .font(OPFontType.CTA.regular)
            }
            .frame(height: OPSize.Button.height)
            .accessibilityLabel(content.leftAccessibilityLabel)
            
            Spacer()
            
            Text(content.title, bundle: .module)
                .font(OPFontType.CTA.regular)
            
            Spacer()
            
            Button(action: content.rightAction) {
                Text(
                    LocalizedStringKey(stringLiteral: content.rightImage),
                    bundle: .module
                )
                .foregroundStyle(Color("Content", bundle: .module))
                .font(OPFontType.CTA.regular)
            }
            .frame(height: OPSize.Button.height)
            .accessibilityLabel(content.rightAccessibilityLabel)
        }
        .padding(OPSpacing.md)
        .background { Color(.black).opacity(0.3) }
    }
}
