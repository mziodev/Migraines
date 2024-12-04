//
//  MigraineList.swift
//  Migraines
//
//  Created by MZiO on 3/12/24.
//

import SwiftData
import SwiftUI

struct MigraineList: View {
    @Query(sort: \Migraine.date, order: .reverse) private var migraines: [Migraine]
    
    @State private var showingAddMigraine = false
    
    private func showAddMigraine() {
        showingAddMigraine = true
    }
    
    var body: some View {
        NavigationStack {
            List(migraines) { migraine in
                NavigationLink(destination: MigraineDetails(migraine: migraine)){
                    MigraineListRow(migraine: migraine)
                }
            }
            .navigationTitle("Migraine list")
            .sheet(isPresented: $showingAddMigraine) {
                MigraineDetails(isNew: true)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: showAddMigraine) {
                        Label("Add", systemImage: "plus")
                    }
                }
                
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
