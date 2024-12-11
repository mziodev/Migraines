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
///
/// ## Properties
/// - `migraines`: A query that retrieves the list of migraines, sorted by date
/// in reverse order.
/// - `showingAddMigraine`: A state variable that determines whether the add
/// migraine sheet is presented.
///
/// ## Methods
/// - `showAddMigraine()`: A private method that sets `showingAddMigraine` to `true`, triggering the display of the add migraine sheet.
///
/// ## User Interaction
/// Users can tap on a migraine in the list to view its details. They can also
/// add a new migraine by tapping the "Add" button in the toolbar,
/// which presents a sheet for entering details of a new migraine.
///
/// ## Example
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         MigraineList()
///     }
/// }
/// ```
struct MigraineList: View {
    
    /// A query that retrieves the list of migraines, sorted by date in reverse order.
    @Query(sort: \Migraine.date, order: .reverse) private var migraines: [Migraine]
    
    @State private var showingAddMigraine = false
    
    private func showAddMigraine() {
        showingAddMigraine = true
    }
    
    var body: some View {
        NavigationStack {
            List(migraines) { migraine in
                NavigationLink {
                    MigraineDetailsView(migraine: migraine)
                } label: {
                    MigraineListRow(migraine: migraine)
                }
            }
            .navigationTitle("Migraine list")
            .sheet(isPresented: $showingAddMigraine) {
                MigraineDetailsView(isNew: true)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: showAddMigraine) {
                        Label("Add", systemImage: "plus")
                    }
                }
                
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
