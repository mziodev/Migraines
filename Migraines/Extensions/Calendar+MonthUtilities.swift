//
//  Calendar+MonthUtilities.swift
//  Migraines
//
//  Created by MZiO on 12/12/24.
//

import Foundation

///
/// This extension adds convenience methods to the `Calendar` class for
/// retrieving days related to specific months and years. It provides
/// functionality to get the days in a month, as well as the days
/// immediately before and after a specified month.
///
/// The methods utilize the `Date` extension to determine the first and
/// last days of the specified months, and they return arrays of strings
/// representing the days. This can be useful for calendar applications
/// or any functionality that requires date manipulation.
///
/// ## Methods
/// - `daysInMonth(of:year:)`: Returns an array of strings representing
///   the days in the specified month and year.
/// - `daysBeforeMonth(of:year:)`: Returns an array of strings representing
///   the days from the previous month that precede the first day of the
///   specified month and year.
/// - `daysAfterMonth(of:year:)`: Returns an array of strings representing
///   the days from the next month that follow the last day of the
///   specified month and year.
///
extension Calendar {
    
    /// Returns an array of strings representing the days in the specified month and year.
    /// - Parameters:
    ///   - month: The month for which to retrieve the days (1-12).
    ///   - year: The year for which to retrieve the days.
    /// - Returns: An array of strings representing the days in the month.
    func daysInMonth(of month: Int, year: Int) -> [String] {
        let lastDay = try! Date.lastDay(of: month, year: year)

        return (1...lastDay.day).map { String($0) }
    }
    
    /// Returns an array of strings representing the days from the previous month
    /// that precede the first day of the specified month and year.
    /// - Parameters:
    ///   - month: The month for which to retrieve the days (1-12).
    ///   - year: The year for which to retrieve the days.
    /// - Returns: An array of strings representing the days before the month.
    func daysBeforeMonth(of month: Int, year: Int) -> [String] {
        let previousMonth = month == 1 ? 12 : month - 1
        let previousYear = month == 1 ? year - 1 : year
        
        
        let firstDay = try! Date.firstDay(of: month, year: year)
        let daysInPreviousMonth = Calendar.current.daysInMonth(
            of: previousMonth,
            year: previousYear
        )
        
        return daysInPreviousMonth.suffix(firstDay.weekday - 1)
    }
    
    /// Returns an array of strings representing the days from the next month
    /// that follow the last day of the specified month and year.
    /// - Parameters:
    ///   - month: The month for which to retrieve the days (1-12).
    ///   - year: The year for which to retrieve the days.
    /// - Returns: An array of strings representing the days after the month.
    func daysAfterMonth(of month: Int, year: Int) -> [String] {
        let nextMonth = month == 12 ? 1 : month + 1
        let nextYear = month == 12 ? year + 1 : year
        
        let lastDay = try! Date.lastDay(of: month, year: year)
        let daysInNextMonth = Calendar.current.daysInMonth(
            of: nextMonth,
            year: nextYear
        )
        
        return Array(daysInNextMonth.prefix(7 - lastDay.weekday))
    }
}
