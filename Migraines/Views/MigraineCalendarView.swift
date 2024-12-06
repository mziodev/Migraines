//
//  MigraineCalendarView.swift
//  Migraines
//
//  Created by MZiO on 4/12/24.
//

import SwiftData
import SwiftUI

struct MigraineCalendar: View {
    @Query(sort: \Migraine.date) var migraines: [Migraine]
    
    @Binding var currentMonth: Int
    @Binding var currentYear: Int
    
    private let gridColumns: [GridItem] = Array(
        repeating: GridItem(),
        count: 7
    )
    
    private var weekdaysFirstLetter: [String]  {
        let firstDayOfTheWeek = Locale.current.firstDayOfWeek
        let weekdays = Weekday.allCases
        
        switch firstDayOfTheWeek {
        case .monday:
            return weekdays.map { $0.firstLetter }
        case .sunday:
            return [Weekday.sunday.firstLetter] + weekdays.dropLast().map({ $0.firstLetter })
        default:
            return []
        }
    }
    
    private var currentMonthMigraines: [Migraine] {
        migraines.filterByMonth(currentMonth, year: currentYear)
    }
    private var daysBeforeCurrentMonth: [String] {
        Calendar.current
            .daysBeforeMonth(of: currentMonth, year: currentYear)
            .map { _ in "" }
    }
    private var daysInCurrentMonth: [String] {
        Calendar.current.daysInMonth(of: currentMonth, year: currentYear)
    }
    private var calendarSymbols: [String] {
        weekdaysFirstLetter + daysBeforeCurrentMonth + daysInCurrentMonth
    }
    
    var body: some View {
        LazyVGrid(columns: gridColumns) {
            ForEach(calendarSymbols.indices, id: \.self) { index in
                let calendarSymbol = calendarSymbols[index]
                
                if weekdaysFirstLetter.contains(calendarSymbol) {
                    MigraineCalendarWeekdayGridItem(
                        calendarSymbol: calendarSymbol
                    )
                } else {
                    if let migraine = currentMonthMigraines.first(where: { String($0.date.day) == calendarSymbol }) {
                        MigraineCalendarMigraineGridItem(
                            calendarSymbol: calendarSymbol,
                            migraineLevel: migraine.level
                        )
                    } else {
                        Text(calendarSymbol)
                            .padding(.vertical, 15)
                    }
                }
            }
        }
    }
}

#Preview {
    MigraineCalendar(currentMonth: .constant(11), currentYear: .constant(2024))
        .modelContainer(SampleData.shared.modelContainer)
}
