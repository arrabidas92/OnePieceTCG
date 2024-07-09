//
//  CardView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 09/07/2024.
//

import SwiftUI

struct CardView: View {
    let url = URL(string: "https://static.opecards.fr/cards/en/op01/image-trading-cards-one-piece-card-game-tcg-opecards-en-op01-001-l-roronoa-zoro.webp")
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: geometry.size.width * 0.45)
        }
    }
}

#Preview {
    CardView()
}
