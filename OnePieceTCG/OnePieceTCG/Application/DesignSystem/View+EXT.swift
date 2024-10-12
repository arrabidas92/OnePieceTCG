//
//  View+EXT.swift
//  OnePieceTCG
//
//  Created by Alexandre DUARTE on 23/09/2024.
//

import SwiftUI

public extension View {
    func skeleton<S>(_ shape: S? = nil as Rectangle?) -> some View where S: Shape {
        let skeletonColor = Color.gray.opacity(0.3)
        
        let skeletonShape: AnyShape = if let shape {
            AnyShape(shape)
        } else {
            AnyShape(Rectangle())
        }
        
        return AnyView(
            opacity(0)
                .overlay(
                    skeletonShape.fill(skeletonColor)
                )
                .shimmering()
        )
    }
    
    func shimmering() -> some View {
        modifier(Shimmering())
    }
}
