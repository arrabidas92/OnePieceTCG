//
//  MetricView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 09/07/2024.
//

import SwiftUI

struct MetricView: View {
    let metric: Metric
    
    var body: some View {
        VStack(alignment: .center, spacing: .sm) {
            Image(systemName: metric.type.imageName)
                .foregroundStyle(Color.black)
            Text(metric.value)
                .font(.caption2)
                .foregroundStyle(Color.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.sm)
        .background(Color.lightGray)
        .clipShape(
            RoundedRectangle(cornerRadius: .sm)
        )
    }
}

#Preview {
    MetricView(metric: .init(
        type: .total, value: "154 CARTES")
    )
}
