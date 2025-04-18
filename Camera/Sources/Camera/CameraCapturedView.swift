//
//  SwiftUIView.swift
//  Camera
//
//  Created by Alexandre DUARTE on 15/04/2025.
//

import SwiftUI
import UI

public struct CameraCapturedView: View {
    @Binding private var manager: CameraManager
    private let image: UIImage
    
    public init(manager: Binding<CameraManager>, image: UIImage) {
        self._manager = manager
        self.image = image
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            OPCameraNavigationBar(
                content: OPCameraNavigationBarContent(
                    leftImage: "retake",
                    leftAccessibilityLabel: "retake",
                    leftAction: { manager.viewState = .preview },
                    title: LocalizedStringKey(stringLiteral: "Confirm capture"),
                    rightImage: "save",
                    rightAccessibilityLabel: "save",
                    rightAction: { print("on save") }
                ),
                style: OPCameraCapturedNavigationBarStyle()
            )
        }
    }
}
