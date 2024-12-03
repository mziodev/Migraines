//
//  Migraine.swift
//  Migraines
//
//  Created by MZiO on 3/12/24.
//

import Foundation
import SwiftData

@Model
class Migraine {
    var date: Date = Date.now
    var level: MigraineLevel = MigraineLevel.mild
    var notes: String = ""
    
    init(date: Date = .now, level: MigraineLevel = .mild, notes: String = "") {
        self.date = date
        self.level = level
        self.notes = notes
    }
}
