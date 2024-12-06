//
//  MigraineCalendarWeekdayGridItem.swift
//  Migraines
//
//  Created by MZiO on 4/12/24.
//

import SwiftUI

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
