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
    
    /// Copies the properties from another `Migraine` instance to the current instance.
    ///
    /// This method allows you to duplicate the values of the `date`, `levelID`, and `notes` properties
    /// from a specified `Migraine` instance. It is useful for creating a new instance with the same
    /// attributes as an existing one or for updating the current instance with values from another instance.
    ///
    /// - Parameter migraine: The `Migraine` instance from which to copy the properties.
    ///   This parameter must not be `nil`.
    ///
    /// ## Example
    /// You can use the `copy(from:)` method to update an existing `Migraine` instance:
    /// ```swift
    /// let migraine1 = Migraine(date: Date(), level: .severe, notes: "Had a bad headache.")
    /// let migraine2 = Migraine()
    /// migraine2.copy(from: migraine1)
    /// // Now migraine2 has the same properties as migraine1
    /// ```
    func copy(from migraine: Migraine) {
        self.date = migraine.date
        self.levelID = migraine.levelID
        self.notes = migraine.notes
    }
}
