//
//  MigraineCalendarMigraineGridItem.swift
//  Migraines
//
//  Created by MZiO on 4/12/24.
//

import SwiftUI

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
