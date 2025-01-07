//
//  ConcentrationUnits.swift
//  Migraines
//
//  Created by MZiO on 30/12/24.
//

import Foundation

enum ConcentrationUnits: String, Codable, CaseIterable {
    case g
    case mg
    case ml
    case mcg
    case percentage
    
    var localizedName: String {
        switch self {
        case .g: String(localized: "g")
        case .mg: String(localized: "mg")
        case .ml: String(localized: "ml")
        case .mcg: String(localized: "mcg")
        case .percentage: String(localized: "%")
        }
    }
}
