//
//  OPViewStyle.swift
//  UI
//
//  Created by Alexandre DUARTE on 04/04/2025.
//

import SwiftUI

public protocol OPViewStyle {
  associatedtype Content
  associatedtype Body: View
    
  @MainActor
  func body(content: Content) -> Body
}
