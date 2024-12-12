//
//  MigraineCalendarWeekdayGridItem.swift
//  Migraines
//
//  Created by MZiO on 12/12/24.
//

import SwiftUI

/// A view representing a grid item for a weekday in the migraine calendar.
///
/// `MigraineCalendarWeekdayGridItem` displays a symbol (either a letter or a
/// number)
/// that represents a day of the week in the migraine calendar. The appearance
/// of the symbol changes based on whether it represents a weekend day or a
/// weekday.
///
/// ## Properties:
/// - `calendarSymbol`: A string representing the symbol to be displayed,
///   which can be a letter (e.g., "S" for Sunday) or a number (e.g., "22" for
///   the 22nd day of the month).
///
/// ## Body:
/// The body of the view consists of a text label styled with a headline font.
/// The text color is determined based on the value of `calendarSymbol`:
/// - If the symbol is "S", the text color is set to secondary.
/// - For all other symbols, the text color is set to primary.
/// The text is also padded vertically to enhance its appearance.
///
/// ### Usage Example:
/// ```swift
/// MigraineCalendarWeekdayGridItem(calendarSymbol: "M")
/// ```
///
struct MigraineCalendarWeekdayGridItem: View {
    let calendarSymbol: String
    
    var body: some View {
        Text(calendarSymbol)
            .font(.headline)
            .foregroundStyle(
                calendarSymbol == "S" ? .secondary : .primary
            )
            .padding(.vertical, 20)
    }
}

#Preview("Letter S symbol") {
    MigraineCalendarWeekdayGridItem(calendarSymbol: "S")
}

#Preview("Number symbol") {
    MigraineCalendarWeekdayGridItem(calendarSymbol: "22")
}
