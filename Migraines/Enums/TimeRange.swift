//
//  TimeRange.swift
//  Migraines
//
//  Created by MZiO on 26/2/25.
//

import Foundation

enum TimeRange: String, CaseIterable {
    case lastMonth
    case lastTrimester
    case lastSemester
    case lastYear
    
    var localizedDescription: String {
        switch self {
        case .lastMonth:
            String(localized: "Last Month")
        case .lastTrimester:
            String(localized: "Last Trimester")
        case .lastSemester:
            String(localized: "Last Semester")
        case .lastYear:
            String(localized: "Last Year")
        }
    }
    
    var startDate: Date {
        let calendar = Calendar.current
        
        switch self {
        case .lastMonth:
            return calendar.date(
                byAdding: .month,
                value: -1,
                to: Date()
            ) ?? Date()
        case .lastTrimester:
            return calendar.date(
                byAdding: .month,
                value: -3,
                to: Date()
            ) ?? Date()
        case .lastSemester:
            return calendar.date(
                byAdding: .month,
                value: -6,
                to: Date()
            ) ?? Date()
        case .lastYear:
            return calendar.date(
                byAdding: .year,
                value: -1,
                to: Date()
            ) ?? Date()
        }
    }
}
