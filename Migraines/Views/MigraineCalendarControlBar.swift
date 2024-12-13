//
//  MigraineCalendarControlBar.swift
//  Migraines
//
//  Created by MZiO on 12/12/24.
//

import SwiftUI

/// A view representing a control bar for navigating through the migraine calendar.
///
/// `MigraineCalendarControlBar` provides buttons to navigate between months
/// in the migraine calendar. It allows users to decrease or increase the
/// current month, as well as jump back to the current month. The control
/// bar is designed to be intuitive and user-friendly, facilitating easy
/// navigation through the calendar.
///
/// ## Properties:
/// - `currentMonth`: A binding to the currently displayed month (1-12).
/// - `currentYear`: A binding to the currently displayed year.
///
/// ## Functions:
/// - `decreaseMonth()`: Decreases the current month by one, adjusting the
///   year if necessary. If the current month is January, it wraps around
///   to December of the previous year.
/// - `increaseMonth()`: Increases the current month by one, adjusting the
///   year if necessary. If the current month is December, it wraps around
///   to January of the next year.
/// - `jumpToCurrentMonth()`: Resets the current month and year to the
///   current date, allowing users to quickly return to the present month.
///
/// ## Body:
/// The body of the view consists of a horizontal stack containing three
/// buttons:
/// - A button to decrease the month, represented by a left chevron icon.
/// - A button to jump to the current month, represented by a record circle icon.
/// - A button to increase the month, represented by a right chevron icon.
///
/// ### Usage Example:
/// ```swift
/// MigraineCalendarControlBar(currentMonth: .constant(10), currentYear: .constant(2024))
/// ```
///
struct MigraineCalendarControlBar: View {
    
    @Binding var currentMonth: Int
    @Binding var currentYear: Int
    
    private func decreaseMonth() {
        withAnimation {
            currentMonth = currentMonth == 1 ? 12 : currentMonth - 1
            currentYear = currentMonth == 12 ? currentYear - 1 : currentYear
        }
    }
    
    private func increaseMonth() {
        withAnimation {
            currentMonth = currentMonth == 12 ? 1 : currentMonth + 1
            currentYear = currentMonth == 1 ? currentYear + 1 : currentYear
        }
    }
    
    private func jumpToCurrentMonth() {
        withAnimation {
            currentMonth = Calendar.current.component(.month, from: .now)
            currentYear = Calendar.current.component(.year, from: .now)
        }
    }
    
    var body: some View {
        HStack {
            Button(action: decreaseMonth) {
                Image(systemName: "chevron.left")
            }
            
            Spacer()
            
            Button(action: jumpToCurrentMonth) {
                Image(systemName: "record.circle")
            }
            
            Spacer()
            
            Button(action: increaseMonth) {
                Image(systemName: "chevron.right")
            }
        }
        .font(.headline)
        .padding()
    }
}

#Preview {
    MigraineCalendarControlBar(
        currentMonth: .constant(10),
        currentYear: .constant(2024)
    )
}
