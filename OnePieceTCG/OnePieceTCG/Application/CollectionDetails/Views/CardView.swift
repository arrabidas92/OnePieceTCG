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
        AsyncImage(
            url: url,
            transaction: Transaction(animation: .linear)
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "wifi.slash")
                //Customized failure image
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    CardView()
}
