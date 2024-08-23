//
//  MetricsHeaderView.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 09/07/2024.
//

import SwiftUI

struct MetricsHeaderView: View {
    let release: Release
    
    var body: some View {
        let _ = Self._printChanges()
        HStack(alignment: .center, spacing: .sm) {
            ForEach(metrics) {
                MetricView(metric: $0)
            }
        }
    }
    
    private var metrics: [Metric] {
        return [
//            Metric(type: .releaseDate, value: release.releaseDate),
//            Metric(type: .total, value: release.totalOfCards),
            Metric(type: .owned, value: "0% POSSÉDÉES")
        ]
    }
}

//#Preview {
//    MetricsHeaderView(collection: .romanceDawn)
//}
