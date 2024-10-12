//
//  ListReleasesErrorView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 12/10/2024.
//

import SwiftUI
//Check how to center align the image and text inside scrollview
struct ListReleasesErrorView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "wifi.slash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

#Preview {
    ListReleasesErrorView()
}
