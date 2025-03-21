//
//  CameraView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 21/02/2025.
//

import SwiftUI
import Camera

struct CameraView: View {
    @Binding var isCameraShown: Bool
    @State var manager = CameraManager()
    
    var body: some View {
        ZStack {
            CameraPreview(session: manager.session)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                CameraHeader(
                    title: "camera.title",
                    onClose: { isCameraShown = false },
                    onToggleFlash: manager.toggleFlashMode,
                    getFlashIcon: { getFlashIcon() }
                )
                
                Spacer()
                
                
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
