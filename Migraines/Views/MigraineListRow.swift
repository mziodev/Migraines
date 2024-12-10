//
//  MigraineListRow.swift
//  Migraines
//
//  Created by MZiO on 10/12/24.
//

import SwiftUI

/// A view that represents a single row in the migraine list.
///
/// This view displays the details of a single `Migraine` instance, including
/// the date of the migraine, its severity level, and a colored circle
/// representing the migraine level.
struct MigraineListRow: View {
    
    /// The `Migraine` instance to be displayed in the row.
    let migraine: Migraine
    
    var body: some View {
        HStack {
            Text(migraine.date.monthDay)
            
            Spacer()
            
            Text(migraine.level.localizedName)
            
            // A circle that represents the migraine level's background color.
            Circle()
                .frame(width: 22, height: 22)
                .foregroundStyle(migraine.level.backgroundColor)
        }
    }
}

#Preview {
    List {
        MigraineListRow(migraine: SampleData.shared.migraine)
    }
}
