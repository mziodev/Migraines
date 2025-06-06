//
//  PalliativeDose.swift
//  Migraines
//
//  Created by MZiO on 2/1/25.
//

import Foundation
import SwiftData

@Model
final class PalliativeDose {

    var amount: Double

    @Relationship var palliative: Palliative?
    @Relationship var migraine: Migraine?
    
    init (
        amount: Double = 0,
        palliative: Palliative? = nil,
        migraine: Migraine? = nil
    ) {
        self.amount = amount
    }
    
    func copy(from palliativeDose: PalliativeDose) {
        self.amount = palliativeDose.amount
        
        if let palliative = palliativeDose.palliative {
            self.palliative = palliative
        }
    }
}
