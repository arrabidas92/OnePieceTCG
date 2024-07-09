//
//  Metric.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 09/07/2024.
//

import Foundation

struct Metric {
    let type: MetricType
    let value: String
}

extension Metric: Identifiable {
    var id: Int { type.hashValue }
}
