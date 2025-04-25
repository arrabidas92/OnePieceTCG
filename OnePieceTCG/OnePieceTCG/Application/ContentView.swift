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
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Wallet")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    OPIconButton(
                        image: "plus",
                        accessibilityLabel: "plus",
                        action: { isCameraShown.toggle() }
                    )
                }
            }
        }
        .sheet(isPresented: $isCameraShown) {
            CameraView { result in
                switch result {
                case .success(let imageData):
                    print("imageData=\(imageData)")
                case .failure(let cameraError):
                    print("cameraError=\(cameraError)")
                }
            }
        }
    }
}
