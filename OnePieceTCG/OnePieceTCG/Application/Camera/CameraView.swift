//
//  CameraView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 21/02/2025.
//

import SwiftUI

struct CameraView: View {
    @State var manager = CameraManager()
    
    var body: some View {
        ZStack {
            CameraPreview(session: manager.session)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: manager.toggleFlashMode) {
                        Image(systemName: getFlashIcon())
                            .tint(Color(.white))
                            .font(.system(size: 22))
                            .frame(width: 44, height: 44)
                    }
                }
                .padding(16)
                .background { Color(.black).opacity(0.3) }
                
                Spacer()
                
                Button(action: manager.capturePhoto) {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                }
                .padding(.bottom, 20)
            }
        }
        .onAppear { manager.configure(); manager.start() }
        .onDisappear { manager.stop() }
    }
    
    private func getFlashIcon() -> String {
        switch manager.flashMode {
        case .off:
            return "bolt.slash.fill"
        case .on:
            return "bolt.fill"
        case .auto:
            return "bolt.badge.a.fill"
        @unknown default:
            return "bolt.slash.fill"
        }
    }
}
