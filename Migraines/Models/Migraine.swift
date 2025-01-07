//
//  Migraine.swift
//  Migraines
//
//  Created by MZiO on 9/12/24.
//


import Foundation
import SwiftData

/// A model representing a migraine event.
///
/// This class stores information about a migraine, including the date it occurred,
/// the severity level, and any additional notes.
///
/// ## Properties
/// - `date`: The date when the migraine occurred.
/// - `levelID`: An integer representing the severity level of the migraine.
/// - `notes`: Additional notes about the migraine event.
///
/// ## Usage
///   You can create a new `Migraine` instance with the current date and a default level:
///   ```swift
///   let migraine = Migraine()
///   ```
@Model
class Migraine {
    
    var date: Date
    var levelID: Int
    var notes: String
    
    @Relationship(deleteRule: .cascade, inverse: \PalliativeDose.migraine)
    var palliativeDoses: [PalliativeDose] = []
    
    var level: MigraineLevel {
        MigraineLevel(rawValue: levelID)!
    }
    
    init(date: Date = .now, level: MigraineLevel = .mild, notes: String = "") {
        self.date = date
        self.levelID = level.rawValue
        self.notes = notes
    }
}

extension Migraine {
    
    func copy(from migraine: Migraine) {
        self.date = migraine.date
        self.levelID = migraine.levelID
        self.notes = migraine.notes
    }
}
