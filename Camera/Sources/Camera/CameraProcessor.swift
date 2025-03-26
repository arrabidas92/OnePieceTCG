//
//  CameraDelegate.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 21/02/2025.
//

import AVFoundation
import UIKit

final class CameraProcessor: NSObject, AVCapturePhotoCaptureDelegate {
    private var imageContinuation: UnsafeContinuation<UIImage, Error>?
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            imageContinuation?.resume(throwing: error)
            imageContinuation = nil
            return
        }
        
        guard let data = photo.fileDataRepresentation() else {
            imageContinuation?.resume(throwing: CameraError.invalidData)
            imageContinuation = nil
            return
        }
        
        guard let image = UIImage(data: data) else {
            imageContinuation?.resume(throwing: CameraError.failedToCreateImage)
            imageContinuation = nil
            return
        }
        
        imageContinuation?.resume(returning: image)
        imageContinuation = nil
    }
    
    func startCapture(
        from photoOutput: AVCapturePhotoOutput,
        using settings: AVCapturePhotoSettings
    ) async throws -> UIImage {
        return try await withUnsafeThrowingContinuation { continuation in
            imageContinuation = continuation
            photoOutput.capturePhoto(with: settings, delegate: self)
        }
    }
}
