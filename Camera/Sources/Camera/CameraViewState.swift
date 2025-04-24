//
//  CameraViewState.swift
//  Camera
//
//  Created by Alexandre DUARTE on 14/04/2025.
//

import UIKit

public enum CameraViewState {
    case preview
    case captured(UIImage)
    case analyze(String)
    case error(CameraError)
    case closed
}
