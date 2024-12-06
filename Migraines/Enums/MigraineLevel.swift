//
//  MigraineLevel.swift
//  Migraines
//
//  Created by MZiO on 3/12/24.
//

import SwiftUI

enum MigraineLevel: Int, Codable, CaseIterable {
    case mild = 1
    case moderate
    case intense
    case extreme
    
    var name: String {
        switch self {
        case .mild: String(localized: "Mild")
        case .moderate: String(localized: "Moderate")
        case .intense: String(localized: "Intense")
        case .extreme: String(localized: "Extreme")
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .mild: .mgPear
        case .moderate: .mgXanthous
        case .intense: .mgPumpkin
        case .extreme: .mgFolly
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .mild, .moderate: .black
        case .intense, .extreme: .white
        }
    }
}
