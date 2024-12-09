//
//  MigraineLevel.swift
//  Migraines
//
//  Created by MZiO on 9/12/24.
//

import Foundation

/// An enumeration representing the severity levels of a migraine.
///
/// This enum defines different levels of migraine severity, each associated with an integer value.
/// It conforms to `Codable` for easy encoding and decoding, and `CaseIterable` to provide a collection
/// of all cases.
///
/// ## Cases:
/// - `mild`: represents a mild migraine, with a raw value of 1.
/// - `moderate`: represents a moderate migraine, with a raw value of 2.
/// - `intense`: represents an intense migraine, with a raw value of 3.
/// - `extreme`: represents an extreme migraine, with a raw value of 4.
enum MigraineLevel: Int, Codable, CaseIterable {
    case mild = 1
    case moderate
    case intense
    case extreme
    
    /// A localized name for the migraine level.
    ///
    /// This computed property returns a string that represents the name of the migraine level
    /// in a localized format, suitable for display in the user interface.
    var localizedName: String {
        switch self {
        case .mild: String(localized: "Mild")
        case .moderate: String(localized: "Moderate")
        case .intense: String(localized: "Intense")
        case .extreme: String(localized: "Extreme")
        }
    }
}
