//
//  Date+MonthUtilities.swift
//  Migraines
//
//  Created by MZiO on 4/12/24.
//

import Foundation

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
