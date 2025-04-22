//
//  SwiftUIView.swift
//  Camera
//
//  Created by Alexandre DUARTE on 15/04/2025.
//

import SwiftUI
import UI

public struct CameraCapturedView: View {
    @Binding private var isCameraShown: Bool
    @Binding private var manager: CameraManager
    private let image: UIImage
    
    public init(isCameraShown: Binding<Bool>, manager: Binding<CameraManager>, image: UIImage) {
        self._isCameraShown = isCameraShown
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
                    leftAction: { manager.retakePhoto() },
                    title: LocalizedStringKey(stringLiteral: "camera.confirm.capture"),
                    rightImage: "save",
                    rightAccessibilityLabel: "save",
                    rightAction: {
                        //Need to return UIImage data then to post to chat gpt to extract data from it
                        dismissCamera()
                    }
                ),
                style: OPCameraCapturedNavigationBarStyle()
            )
        }
        .onAppear { manager.stop() }
    }
    
    private func dismissCamera() { //Redundant function with CameraPreviewView
        isCameraShown = false
    }
}
