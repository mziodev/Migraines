//
//  PalliativeType.swift
//  Migraines
//
//  Created by MZiO on 30/12/24.
//

import Foundation

enum PalliativeType: String, Codable, CaseIterable {
    case none
    case analgesic
    case antiemetic
    case corticosteroid
    case ergot
    case opioid
    case triptan
    
    var localizedName: String {
        switch self {
        case .none: String(localized: "Select")
        case .analgesic: String(localized: "Analgesic")
        case .antiemetic: String(localized: "Antiemetic")
        case .corticosteroid: String(localized: "Corticosteroid")
        case .ergot: String(localized: "Ergot")
        case .opioid: String(localized: "Opioid")
        case .triptan: String(localized: "Triptan")
        }
    }
}
