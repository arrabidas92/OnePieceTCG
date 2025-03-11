//
//  CloseButtonView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 11/03/2025.
//

import SwiftUI

struct CloseButtonView: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .foregroundColor(Color(.label))
                .font(.system(size: 22))
                .frame(width: 44, height: 44)
                .accessibilityLabel("Close")
        }
    }
}

#Preview {
    CloseButtonView {}
}
