//
//  HomeView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 11/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showCamera = false
    
    var body: some View {
        Button("Open Camera") {
            showCamera.toggle()
        }
        .sheet(isPresented: $showCamera) {
            CameraView()
        }
    }
}
