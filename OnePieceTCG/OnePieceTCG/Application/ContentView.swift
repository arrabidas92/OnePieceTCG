//
//  HomeView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 11/02/2025.
//

import SwiftUI
import Camera
import UI

struct ContentView: View {
    @State private var isCameraShown = false
    
    var body: some View {
        Button("camera.cta") {
            isCameraShown.toggle()
        }
        .sheet(isPresented: $isCameraShown) {
            CameraView(isCameraShown: $isCameraShown)
        }
    }
}
