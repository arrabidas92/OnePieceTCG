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

public typealias CameraResult = (Result<String, CameraError>) -> Void

public struct CameraView: View {
    @Environment(\.dismiss) var dismiss
    @State private var manager: CameraManager
    private let result: CameraResult
    
    public init(result: @escaping CameraResult) {
        self.result = result
        self._manager = State(
            initialValue: CameraManager(flashMode: .off)
        )
    }
    
    public var body: some View {
        switch manager.viewState {
        case .preview:
            CameraPreviewView(manager: manager) { dismiss() }
        case .captured(let image):
            CameraCapturedView(manager: manager, image: image) {
                print("imageData=\($0)")
                dismiss()
            }
        case .error(let error):
            //TO IMPLEMENT ERROR VIEW
            EmptyView()
        }
    }
}
