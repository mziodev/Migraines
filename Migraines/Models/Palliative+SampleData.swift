//
//  Palliative+SampleData.swift
//  Migraines
//
//  Created by MZiO on 30/12/24.
//

import Foundation

extension Palliative {
    static var sampleData = [
        Palliative(
            name: "Neobrufen",
            type: .analgesic,
            format: .liquid,
            concentration: 400,
            concentrationUnits: .mg
        ),
        
        Palliative(
            name: "Zomig",
            type: .triptan,
            format: .tablet,
            concentration: 2.5,
            concentrationUnits: .mg
        ),
    ]
}
