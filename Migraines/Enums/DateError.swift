//
//  DateError.swift
//  Migraines
//
//  Created by MZiO on 12/12/24.
//

import Foundation

///
/// `DateError` is an enumeration that represents various errors that can occur
/// during date-related operations.
///
/// This enum conforms to the `Error` protocol, allowing it to be used in error
/// handling contexts. The cases defined in this enum help identify specific
/// issues that may arise, such as providing an invalid month or failing to
/// create a date from given parameters.
///
/// Each case includes a description that provides a user-friendly message
/// to help diagnose the problem. This can be particularly useful for
/// displaying error messages in user interfaces or logging errors for
/// debugging purposes.
///
/// ## Cases
/// - `invalidMonth`: Indicates that the provided month is invalid.
/// - `failedToCreateDate`: Indicates that the date could not be created.
///
enum DateError: Error {
    case invalidMonth
    case failedToCreateDate
    
    var description: String {
        switch self {
        case .invalidMonth:
            String(localized: "This is an invalid month, please check your input.")
        case .failedToCreateDate:
            String(localized: "Failed to create a date, please try again.")
        }
    }
}
