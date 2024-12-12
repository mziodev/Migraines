//
//  Weekday.swift
//  Migraines
//
//  Created by MZiO on 12/12/24.
//

import Foundation

///
/// `Weekday` is an enumeration representing the days of the week.
/// It provides a type-safe way to work with weekdays in applications.
///
/// This enum conforms to the `String` type, allowing each case to be
/// represented as a string, and to the `CaseIterable` protocol, enabling
/// iteration over all cases.
///
/// ### Cases
/// - `monday`: Represents Monday.
/// - `tuesday`: Represents Tuesday.
/// - `wednesday`: Represents Wednesday.
/// - `thursday`: Represents Thursday.
/// - `friday`: Represents Friday.
/// - `saturday`: Represents Saturday.
/// - `sunday`: Represents Sunday.
///
/// ### Properties
/// - `firstLetter`: Returns the first letter of the weekday as a localized string.
///
/// ### Usage Example
/// ```swift
/// let today = Weekday.friday
/// print(today.firstLetter) // Output: "F"
/// ```
///
enum Weekday: String, CaseIterable {
    
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    /// Returns the first letter of the weekday as a localized string.
    var firstLetter: String {
        switch self {
        case .monday: String(localized: "M")
        case .tuesday: String(localized: "T")
        case .wednesday: String(localized: "W")
        case .thursday: String(localized: "T")
        case .friday: String(localized: "F")
        case .saturday: String(localized: "S")
        case .sunday: String(localized: "S")
        }
    }
}
