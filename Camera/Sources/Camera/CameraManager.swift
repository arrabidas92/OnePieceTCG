//
//  CameraManager.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 21/02/2025.
//

import SwiftUI
import AVFoundation

@Observable final class CameraManager: @unchecked Sendable {
    @MainActor var capturedImage: UIImage?
    var flashMode: AVCaptureDevice.FlashMode
    
    private(set) var session = AVCaptureSession()
    private let photoOutput = AVCapturePhotoOutput()
    private let sessionQueue = DispatchQueue(label: "com.oway.app.onepiecetcg.session.queue")
    private let cameraProcessor = CameraProcessor()
    
    init(flashMode: AVCaptureDevice.FlashMode) {
        self.flashMode = flashMode
    }
    
    func configure() {
        sessionQueue.async {
            self.session.beginConfiguration()
            self.session.sessionPreset = .photo
            
            guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
                  let input = try? AVCaptureDeviceInput(device: device),
                  self.session.canAddInput(input) else { return }
            
            self.session.addInput(input)
            
            if self.session.canAddOutput(self.photoOutput) {
                self.session.addOutput(self.photoOutput)
            }
            
            self.session.commitConfiguration()
        }
    }
    
    func start() {
        sessionQueue.async {
            if !self.session.isRunning {
                self.session.startRunning()
            }
        }
    }
    
    func stop() {
        sessionQueue.async {
            if self.session.isRunning {
                self.session.stopRunning()
            }
        }
    }
    
    func toggleFlashMode() {
        switch flashMode {
        case .off:
            flashMode = .on
        case .on:
            flashMode = .auto
        case .auto:
            flashMode = .off
        @unknown default:
            flashMode = .off
        }
    }
    
    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        settings.flashMode = flashMode
        
        Task { @MainActor in
            do {
                capturedImage = try await cameraProcessor.startCapture(from: photoOutput, using: settings)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
