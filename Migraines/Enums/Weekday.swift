//
//  Weekday.swift
//  Migraines
//
//  Created by MZiO on 5/12/24.
//

import Foundation

enum Weekday: String, CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
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
