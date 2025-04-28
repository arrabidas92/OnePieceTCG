//
//  SwiftUIView.swift
//  Camera
//
//  Created by Alexandre DUARTE on 15/04/2025.
//

import SwiftUI
import UI

public typealias CameraImageDataResult = (String) -> Void

public struct CameraCapturedView: View {
    private let manager: CameraManager
    private let image: UIImage
    private let imageDataResult: CameraImageDataResult
    
    public init(
        manager: CameraManager,
        image: UIImage,
        imageDataResult: @escaping CameraImageDataResult
    ) {
        self.manager = manager
        self.image = image
        self.imageDataResult = imageDataResult
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
                    rightAction: { getImageData(from: image) }
                ),
                style: OPCameraCapturedNavigationBarStyle()
            )
        }
        .onAppear { manager.stop() }
    }
    
    private func getImageData(from image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            manager.viewState = .error(CameraError.failedToGetJpegData)
            return
        }
        
        let base64 = imageData.base64EncodedString()
        imageDataResult(base64)
    }
}
