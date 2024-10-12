//
//  ListReleasesProgressView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 12/10/2024.
//

import SwiftUI

struct ListReleasesProgressView: View {
    var body: some View {
        GeometryReader { geometry in
            let screenHeight = UIScreen.main.bounds.height
            let nbLoadingPlaceholders = (screenHeight / CGFloat.xxxl).rounded()
            let startRange = 1
            let endRange = Int(nbLoadingPlaceholders)
            
            VStack {
                ForEach(startRange...endRange, id: \.self) { index in
                    RoundedRectangle(cornerRadius: .md)
                        .skeleton(
                            RoundedRectangle(cornerRadius: .md)
                        )
                        .padding(.horizontal, .md)
                        .frame(
                            width: geometry.size.width,
                            height: .xxxl
                        )
                }
            }
        }
    }
}

#Preview {
    ListReleasesProgressView()
}
