//
//  Date+Format.swift
//  Migraines
//
//  Created by MZiO on 10/12/24.
//

import Foundation

/// An extension to the `Date` type that provides additional format functionality.
extension Date {
    
    /// A formatted string representing the date in "Month Day" format.
    ///
    /// This computed property returns a string that formats the date to display
    /// only the month and day, using the current locale's date formatting style.
    ///
    /// - Returns: A `String` representing the date in "Month Day" format (e.g., "Jan 1").
    var monthDay: String {
        self.formatted(.dateTime.month().day())
    }
}
