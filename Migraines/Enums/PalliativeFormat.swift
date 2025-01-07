//
//  PalliativeFormat.swift
//  Migraines
//
//  Created by MZiO on 30/12/24.
//

import Foundation

enum PalliativeFormat: String, Codable, CaseIterable {
    case none
    case capsule
    case injection
    case liquid
    case nasal
    case suppository
    case tablet
    case transdermal
    
    var localizedName: String {
        switch self {
        case .none: String(localized: "Select")
        case .capsule: String(localized: "Capsule")
        case .injection: String(localized: "Injection")
        case .liquid: String(localized: "Liquid")
        case .nasal: String(localized: "Nasal Spray")
        case .suppository: String(localized: "Suppository")
        case .tablet: String(localized: "Tablet")
        case .transdermal: String(localized: "Transdermal Patch")
        }
    }
    
    var imageName: String {
        switch self {
        case .none: String(localized: "cross.case")
        case .capsule: "capsule.portrait.tophalf.filled"
        case .injection: "syringe.fill"
        case .liquid: "cross.vial.fill"
        case .nasal: "humidifier.and.droplets.fill"
        case .suppository: "capsule.portrait.fill"
        case .tablet: "pills.fill"
        case .transdermal: "bandage.fill"
        }
    }
    
    var measurementUnit: String {
        switch self {
        case .none: ""
        case .capsule, .suppository, .tablet, .transdermal:
            String(localized: "units")
        case .nasal: String(localized: "spray", comment: "representing a dose")
        case .injection, .liquid:
            String(localized: "ml")
        }
    }
}
