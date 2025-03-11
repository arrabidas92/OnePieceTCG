//
//  HomeView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 11/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isCameraShown = false
    
    var body: some View {
        Button("Open Camera") {
            isCameraShown.toggle()
        }
        .sheet(isPresented: $isCameraShown) {
            CameraView(isCameraShown: $isCameraShown)
        }
    }
}
