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
    //Add to top right bar
    var body: some View {
        OPIconButton(
            image: "xmark",
            accessibilityLabel: "close",
            action: { isCameraShown.toggle() }
        )
        .sheet(isPresented: $isCameraShown) {
            CameraView(isCameraShown: $isCameraShown)
        }
    }
}
