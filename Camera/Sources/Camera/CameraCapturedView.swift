//
//  SwiftUIView.swift
//  Camera
//
//  Created by Alexandre DUARTE on 15/04/2025.
//

import SwiftUI
import UI

public struct CameraCapturedView: View {
    private let manager: CameraManager
    private let image: UIImage
    
    public init(
        manager: CameraManager,
        image: UIImage
    ) {
        self.manager = manager
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
                    leftAction: { manager.retakePhoto() },
                    title: LocalizedStringKey(stringLiteral: "camera.confirm.capture"),
                    rightImage: "save",
                    rightAccessibilityLabel: "save",
                    rightAction: { manager.convertToBase64(image: image) }
                ),
                style: OPCameraCapturedNavigationBarStyle()
            )
        }
        .onAppear { manager.stop() }
    }
}
