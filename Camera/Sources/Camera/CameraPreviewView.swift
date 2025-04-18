//
//  SwiftUIView.swift
//  Camera
//
//  Created by Alexandre DUARTE on 15/04/2025.
//

import SwiftUI
import UI

public struct CameraPreviewView: View {
    @Binding private var isCameraShown: Bool
    @Binding private var manager: CameraManager
    
    public init(isCameraShown: Binding<Bool>, manager: Binding<CameraManager>) {
        self._isCameraShown = isCameraShown
        self._manager = manager
    }
    
    public var body: some View {
        ZStack {
            CameraPreview(session: manager.session)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                OPCameraNavigationBar(
                    content: OPCameraNavigationBarContent(
                        leftImage: "xmark",
                        leftAccessibilityLabel: "close",
                        leftAction: { isCameraShown = false },
                        title: LocalizedStringKey(stringLiteral: "camera.title"),
                        rightImage: getFlashIcon(),
                        rightAccessibilityLabel: "flash",
                        rightAction: { manager.toggleFlashMode() }
                    ),
                    style: OPCameraPreviewNavigationBarStyle()
                )
                
                Spacer()
                
                OPCircleButton(accessibilityLabel: "capture.button") { manager.capturePhoto() }
                    .padding(.bottom, OPSpacing.sm)
            }
        }
        .onAppear { manager.configure(); manager.start() }
        .onDisappear { manager.stop() }
    }
    
    private func getFlashIcon() -> String {
        switch manager.flashMode {
        case .off:
            return "bolt.slash.fill"
        case .on:
            return "bolt.fill"
        case .auto:
            return "bolt.badge.a.fill"
        @unknown default:
            return "bolt.slash.fill"
        }
    }
}
