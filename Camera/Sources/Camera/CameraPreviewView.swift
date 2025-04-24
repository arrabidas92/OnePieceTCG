//
//  SwiftUIView.swift
//  Camera
//
//  Created by Alexandre DUARTE on 15/04/2025.
//

import SwiftUI
import UI

public struct CameraPreviewView: View {
    private let manager: CameraManager
    
    public init(manager: CameraManager) {
        self.manager = manager
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
                        leftAction: { stopCamera() },
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
        .onAppear { manager.start() }
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
    
    private func stopCamera() {
        manager.stop()
    }
}
