//
//  MigraineLevel.swift
//  Migraines
//
//  Created by MZiO on 9/12/24.
//

import SwiftUI

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
        case .mild: String(localized: "Mild", comment: "Feminine, like migraine")
        case .moderate: String(localized: "Moderate", comment: "Feminine, like migraine")
        case .intense: String(localized: "Intense", comment: "Feminine, like migraine")
        case .extreme: String(localized: "Extreme", comment: "Feminine, like migraine")
        }
    }
    
    /// The background color associated with each migraine level.
    ///
    /// This computed property returns a `Color` value that corresponds to the
    /// severity of the migraine. Each case of the `MigraineLevel` enum is
    /// mapped to a specific color:
    /// - `.mild`: Returns `mgPear` color (Hex #DCE659).
    /// - `.moderate`: Returns `mgXanthous` color (Hex #FCBA36).
    /// - `.intense`: Returns `mgPumpkin` color (Hex #FD7E35).
    /// - `.extreme`: Returns `mgFolly` color (Hex #FC225C).
    ///
    /// - Returns: A `Color` representing the background color for the migraine level.
    var backgroundColor: Color {
        switch self {
        case .mild: .mgPear
        case .moderate: .mgXanthous
        case .intense: .mgPumpkin
        case .extreme: .mgFolly
        }
    }
    
    /// The foreground color associated with each migraine level.
    ///
    /// This computed property returns a `Color` value that is suitable for
    /// text or other foreground elements displayed on the background color
    /// associated with the migraine level. The color is chosen to ensure good
    /// contrast and readability:
    /// - `.mild` and `.moderate`: Returns black for better visibility on
    /// lighter backgrounds.
    /// - `.intense` and `.extreme`: Returns white for better visibility on
    /// darker backgrounds.
    ///
    /// - Returns: A `Color` representing the foreground color for the migraine level.
    var foregroundColor: Color {
        switch self {
        case .mild, .moderate: .black
        case .intense, .extreme: .white
        }
    }
}
