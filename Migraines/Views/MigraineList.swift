//
//  MigraineList.swift
//  Migraines
//
//  Created by MZiO on 10/12/24.
//

import SwiftData
import SwiftUI

/// A view that displays a list of migraines.
///
/// This view uses a `NavigationStack` to present a list of `Migraine` instances,
/// allowing users to navigate through their migraine records. The list is sorted
/// by date in reverse order, showing the most recent migraines first.
struct MigraineList: View {
    
    /// A query that retrieves the list of migraines, sorted by date in reverse order.
    @Query(sort: \Migraine.date, order: .reverse) private var migraines: [Migraine]
    
    var body: some View {
        NavigationStack {
            List(migraines) { migraine in
                MigraineListRow(migraine: migraine)
            }
            .navigationTitle("Migraine list")
            .toolbar {
                // Displays the count of migraines in the toolbar.
                ToolbarItem(placement: .status) {
                    Text("\(migraines.count) migraines")
                        .font(.caption)
                }
            }
        }
    }
}

#Preview {
    MigraineList()
        .modelContainer(SampleData.shared.modelContainer)
}
