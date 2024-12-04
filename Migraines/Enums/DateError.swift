//
//  DateError.swift
//  Migraines
//
//  Created by MZiO on 4/12/24.
//

import Foundation

enum DateError: Error {
    case invalidMonth
    case failedToCreateDate
    
    var description: String {
        switch self {
        case .invalidMonth:
            String(localized: "This is an invalid month, please check your input.")
        case .failedToCreateDate:
            String(localized: "Failed to create date, please try again.")
        }
    }
}
