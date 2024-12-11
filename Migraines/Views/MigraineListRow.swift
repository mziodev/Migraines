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
/// representing the migraine level. It is typically used within a list context,
/// such as in the `MigraineList` view.
///
/// ## Properties
/// - `migraine`: The `Migraine` instance to be displayed in the row. This property is required
///   and contains the data to be shown.
///
/// ## Body
/// The view consists of a horizontal stack (`HStack`) that displays:
/// - The date of the migraine formatted as month and day.
/// - The severity level of the migraine as text.
/// - A colored circle that represents the migraine level's background color.
///
/// ## Example
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         List(migraines) { migraine in
///             MigraineListRow(migraine: migraine)
///         }
///     }
/// }
/// ```
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
