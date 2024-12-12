//
//  Date+MonthUtilities.swift
//  Migraines
//
//  Created by MZiO on 12/12/24.
//

import Foundation

///
/// This extension adds convenience properties and methods to the `Date` class
/// for easier manipulation and retrieval of date components. It provides
/// computed properties to access the day, month, year, and weekday of a
/// `Date` instance, as well as static methods to determine the first and
/// last days of a given month and year.
///
/// The `weekday` property returns the day of the week as an integer,
/// adjusted based on the current calendar's first weekday setting.
/// The `firstDay(of:year:)` and `lastDay(of:year:)` methods allow for
/// the creation of dates corresponding to the first and last days of
/// specified months, with error handling for invalid inputs.
///
/// ## Properties
/// - `day`: Returns the day of the month for the date instance.
/// - `weekday`: Returns the day of the week for the date instance,
///   adjusted to start from 1 for the first day of the week.
/// - `month`: Returns the month of the year for the date instance.
/// - `year`: Returns the year for the date instance.
///
/// ## Methods
/// - `firstDay(of:year:)`: Returns the first day of the specified month
///   and year. Throws a `DateError` if the month is invalid.
/// - `lastDay(of:year:)`: Returns the last day of the specified month
///   and year. Throws a `DateError` if the month is invalid or if
///   the date cannot be created.
///
extension Date {
    
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var weekday: Int {
        var calendar = Calendar.current
        calendar.locale = Locale.current
        
        let weekday = calendar.component(.weekday, from: self)
        
        return (weekday + 7 - calendar.firstWeekday) % 7 + 1
    }
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
    
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
    
    /// Returns the first day of the specified month and year.
    /// - Parameters:
    ///   - month: The month for which to find the first day (1-12).
    ///   - year: The year for which to find the first day.
    /// - Throws: `DateError.invalidMonth` if the month is not in the range 1-12.
    /// - Throws: `DateError.failedToCreateDate` if the date cannot be created.
    /// - Returns: A `Date` object representing the first day of the month.
    static func firstDay(of month: Int, year: Int) throws -> Date {
        
        guard (1...12).contains(month) else {
            throw DateError.invalidMonth
        }
        
        var utcCalendar = Calendar(identifier: .gregorian)
        utcCalendar.timeZone = TimeZone(identifier: "UTC")!
        
        let dateComponents = DateComponents(year: year, month: month, day: 1)
        
        guard let date = utcCalendar.date(from: dateComponents) else {
            throw DateError.failedToCreateDate
        }
        
        return date
    }
    
    /// Returns the last day of the specified month and year.
    /// - Parameters:
    ///   - month: The month for which to find the last day (1-12).
    ///   - year: The year for which to find the last day.
    /// - Throws: `DateError.invalidMonth` if the month is not in the range 1-12.
    /// - Throws: `DateError.failedToCreateDate` if the date cannot be created.
    /// - Returns: A `Date` object representing the last day of the month.
    static func lastDay(of month: Int, year: Int) throws -> Date {
        
        do {
            let firstOfNextMonth = try firstDay(
                of: month == 12 ? 1 : month + 1,
                year: month == 12 ? year + 1 : year
            )
            
            let lastDay = Calendar.current.date(
                byAdding: .day,
                value: -1,
                to: firstOfNextMonth
            ) ?? .now
            
            return lastDay
        } catch let error as DateError {
            throw error
        }
    }
}
