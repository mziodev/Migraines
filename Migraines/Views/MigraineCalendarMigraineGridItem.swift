//
//  MigraineCalendarMigraineGridItem.swift
//  Migraines
//
//  Created by MZiO on 12/12/24.
//

import SwiftUI

/// A view representing a grid item in the migraine calendar.
///
/// `MigraineCalendarMigraineGridItem` displays a circular item that visually
/// represents a migraine occurrence on a calendar. The item is styled based
/// on the severity level of the migraine, using different background and
/// foreground colors to convey information at a glance.
///
/// ## Properties:
/// - `calendarSymbol`: A string representing the date or symbol to be displayed
///   within the grid item.
/// - `migraineLevel`: An instance of `MigraineLevel` that determines the
///   visual styling of the grid item, including its background and foreground
///   colors.
///
/// ## Body:
/// The body of the view consists of a circular shape with a specified frame
/// and a text label centered within it. The background color is determined
/// by the `migraineLevel`, while the text color is also derived from the
/// same level to ensure good contrast and readability.
///
/// ### Usage Example:
/// ```swift
/// MigraineCalendarMigraineGridItem(
///     calendarSymbol: "22",
///     migraineLevel: .intense
/// )
/// ```
///
struct MigraineCalendarMigraineGridItem: View {
    let calendarSymbol: String
    let migraineLevel: MigraineLevel
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 44, height: 44)
                .foregroundStyle(
                    migraineLevel.backgroundColor
                )
            
            Text(calendarSymbol)
                .foregroundStyle(
                    migraineLevel.foregroundColor
                )
        }
    }
}

#Preview {
    MigraineCalendarMigraineGridItem(
        calendarSymbol: "22",
        migraineLevel: SampleData.shared.migraine.level
    )
}
