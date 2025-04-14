//
//  CameraView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 21/02/2025.
//

import SwiftUI
import AVFoundation
import UI

public struct CameraView: View {
    @Binding private var isCameraShown: Bool
    @State private var manager: CameraManager
    
    public init(isCameraShown: Binding<Bool>) {
        self._isCameraShown = isCameraShown
        self._manager = State(
            initialValue: CameraManager(flashMode: .off)
        )
    }
    
    public var body: some View {
        switch manager.viewState {
        case .preview:
            ZStack {
                CameraPreview(session: manager.session)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    CameraHeader(
                        onClose: { isCameraShown = false },
                        onToggleFlash: manager.toggleFlashMode,
                        getFlashIcon: { getFlashIcon() }
                    )
                    
                    Spacer()
                    
                    OPCircleButton(
                        accessibilityLabel: "capture.button"
                    ) {
                        manager.capturePhoto()
                    }
                    .padding(.bottom, OPSpacing.sm)
                }
            }
            .onAppear { manager.configure(); manager.start() }
            .onDisappear { manager.stop() }
        case .captured(let image):
            //TODO:Refactor this to his own view
            ZStack(alignment: .top) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                
                CameraHeader(
                    onClose: { isCameraShown = false },
                    onToggleFlash: manager.toggleFlashMode,
                    getFlashIcon: { getFlashIcon() }
                )
            }
            .edgesIgnoringSafeArea(.all)
        }
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
