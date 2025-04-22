//
//  CameraView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 21/02/2025.
//

import SwiftUI
import AVFoundation
import UI

//TODO: Send captured image to chat gpt to extract infos about the card captured
//TODO: Once got the result chat gpt then give price estimation and call user to fulfille which version of the card is it: v1, v2 ...and also the condition of the card if possible

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
            CameraPreviewView(isCameraShown: $isCameraShown, manager: $manager)
        case .captured(let image):
            CameraCapturedView(isCameraShown: $isCameraShown, manager: $manager, image: image)
        }
    }
}
