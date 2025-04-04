//
//  OPFontType.swift
//  UI
//
//  Created by Alexandre DUARTE on 21/03/2025.
//

import SwiftUI

public enum OPFontType {
    public enum CTA {
        /// Light (400) 22px
        public static let light = Font.system(size: 22.0, weight: .light)
        
        /// Regular (400) 22px
        public static let regular = Font.system(size: 22.0, weight: .regular)
        
        /// Semi-Bold (600) 22px
        public static let semibold = Font.system(size: 22.0, weight: .semibold)
        
        /// Regular (400) 22p bold
        public static let bold = Font.system(size: 22.0, weight: .bold)
    }
}

