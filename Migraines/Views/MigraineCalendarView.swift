//
//  MigraineCalendarView.swift
//  Migraines
//
//  Created by MZiO on 12/12/24.
//

import SwiftData
import SwiftUI

/// A view representing a calendar for tracking migraines.
///
/// `MigraineCalendar` displays a grid layout of the days in a specified month,
/// highlighting days with recorded migraines. The calendar adapts to the
/// user's locale to determine the first day of the week and displays the
/// corresponding weekdays and dates.
///
/// ## Properties:
/// - `migraines`: An array of `Migraine` objects fetched from the data model,
///   sorted by date.
/// - `currentMonth`: A binding to the currently displayed month (1-12).
/// - `currentYear`: A binding to the currently displayed year.
///
/// ## State Properties:
/// - `selectedDay`: An optional string representing the currently selected day.
/// - `showingAddMigraine`: A boolean indicating whether the add migraine view
///   should be presented.
///
/// ## Private Properties:
/// - `gridColumns`: An array of `GridItem` used to define the layout of the
///   calendar grid, with 7 columns representing the days of the week.
/// - `weekdaysFirstLetter`: An array of strings representing the first letters
///   of the weekdays, adjusted based on the user's locale.
/// - `currentMonthMigraines`: An array of `Migraine` objects filtered to include
///   only those that occurred in the current month and year.
/// - `daysBeforeCurrentMonth`: An array of empty strings representing the days
///   before the current month, used for layout purposes.
/// - `daysInCurrentMonth`: An array of strings representing the days in the
///   current month.
/// - `calendarSymbols`: A combined array of weekday initials, days before the
///   current month, and days in the current month, used to populate the grid.
///
/// ## Functions:
/// - `createDate(from:)`: Creates a `Date` object from the given day string.
///
/// ## Body:
/// The body of the view consists of a lazy vertical grid that displays each
/// day of the month. It differentiates between weekdays and migraine days,
/// rendering appropriate views for each:
/// - For weekdays, it uses `MigraineCalendarWeekdayGridItem`.
/// - For days with recorded migraines, it uses `MigraineCalendarMigraineGridItem`.
/// - For days without migraines, it displays the day number as text.
///
/// ### Usage Example:
/// ```swift
/// MigraineCalendar(currentMonth: .constant(11), currentYear: .constant(2024))
/// ```
///
struct MigraineCalendar: View {
    @Query(sort: \Migraine.date) var migraines: [Migraine]
    
    @Binding var currentMonth: Int
    @Binding var currentYear: Int
    
    @State private var selectedDay: String?
    @State private var showingAddMigraine: Bool = false
    
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
    
    private func createDate(from day: String) -> Date? {
        Calendar.current.date(
            from: DateComponents(
                year: currentYear,
                month: currentMonth,
                day: Int(day)
            )
        )
    }
    
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: gridColumns) {
                ForEach(calendarSymbols.indices, id: \.self) { index in
                    let calendarSymbol = calendarSymbols[index]
                    
                    if weekdaysFirstLetter.contains(calendarSymbol) {
                        MigraineCalendarWeekdayGridItem(
                            calendarSymbol: calendarSymbol
                        )
                    } else {
                        if let migraine = currentMonthMigraines.first(where: { String($0.date.day) == calendarSymbol }) {
                            NavigationLink {
                                MigraineDetailsView(migraine: migraine)
                            } label: {
                                MigraineCalendarMigraineGridItem(
                                    calendarSymbol: calendarSymbol,
                                    migraineLevel: migraine.level
                                )
                            }
                        } else {
                            Text(calendarSymbol)
                                .padding(.vertical, 15)
                                .onTapGesture {
                                    selectedDay = calendarSymbol
                                }
                        }
                    }
                }
            }
            .frame(maxHeight: 420)
            .sheet(isPresented: $showingAddMigraine) {
                if let day = selectedDay,
                    let date = createDate(from: day) {
                    MigraineDetailsView(
                        migraine: Migraine(date: date),
                        isNew: true
                    )
                }
            }
            .onChange(of: selectedDay) { oldVlue, newValue in
                if newValue != nil {
                    showingAddMigraine = true
                }
            }
        }
    }
}

#Preview {
    MigraineCalendar(currentMonth: .constant(11), currentYear: .constant(2024))
        .modelContainer(SampleData.shared.modelContainer)
}
