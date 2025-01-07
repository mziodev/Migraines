//
//  Palliative.swift
//  Migraines
//
//  Created by MZiO on 30/12/24.
//

import Foundation
import SwiftData

@Model
final class Palliative {
    var name: String
    var type: PalliativeType
    var format: PalliativeFormat
    var concentration: Double
    var concentrationUnits: ConcentrationUnits
    
    @Relationship(deleteRule: .cascade, inverse: \PalliativeDose.palliative)
    var doses: [PalliativeDose] = []
    
    init(
        name: String = "",
        type: PalliativeType = .none,
        format: PalliativeFormat = .none,
        concentration: Double = 0,
        concentrationUnits: ConcentrationUnits = .mg
    ) {
        self.name = name
        self.type = type
        self.format = format
        self.concentration = concentration
        self.concentrationUnits = concentrationUnits
    }
}

extension Palliative {
    var concentrationInfo: String {
        concentration.formatted(.number) + " " + concentrationUnits.localizedName
    }
    
    func copy(from palliative: Palliative) {
        self.name = palliative.name
        self.type = palliative.type
        self.format = palliative.format
        self.concentration = palliative.concentration
        self.concentrationUnits = palliative.concentrationUnits
    }
}
