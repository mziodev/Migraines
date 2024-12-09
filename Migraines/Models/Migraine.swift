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
    
    /// The date when the migraine occurred.
    var date: Date
    
    /// An integer representing the severity level of the migraine.
    var levelID: Int
    
    /// Additional notes about the migraine event.
    var notes: String
    
    /// The severity level of the migraine, derived from the `levelID`.
    var level: MigraineLevel {
        MigraineLevel(rawValue: levelID)!
    }
    
    /// Initializes a new `Migraine` instance with the specified date, severity level, and notes.
    ///
    /// - Parameters:
    ///   - date: The date when the migraine occurred. Defaults to the current date.
    ///   - level: The severity level of the migraine. Defaults to `.mild`.
    ///   - notes: Additional notes about the migraine event. Defaults to an empty string.
    init(date: Date = .now, level: MigraineLevel = .mild, notes: String = "") {
        self.date = date
        self.levelID = level.rawValue
        self.notes = notes
    }
}
