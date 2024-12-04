//
//  MigraineDetails.swift
//  Migraines
//
//  Created by MZiO on 4/12/24.
//

import SwiftData
import SwiftUI

struct MigraineDetails: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var migraine: Migraine
    
    @State private var isMigraineSaved = false
    @State private var showingDeleteAlert = false
    
    let isNew: Bool
    let originalMigraine = Migraine()
    
    private var migraineDetailsTitle: String {
        isNew ? "New migraine" : "Migraine details"
    }
    
    init(migraine: Migraine = Migraine(), isNew: Bool = false) {
        self.migraine = migraine
        self.isNew = isNew
        
        self.originalMigraine.copy(from: migraine)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Date") {
                    DatePicker(
                        "Migraine date",
                        selection: $migraine.date,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                }
                
                Section("Level") {
                    MigraineDetailsLevelSelectorView(migraine: $migraine)
                }
                
                Section("Notes") {
                    TextField(
                        "Write how you felt...",
                        text: $migraine.notes,
                        axis: .vertical
                    )
                    .padding()
                }
                
                if !isNew {
                    Section {
                        Button("Delete Migraine", action: showDeleteAlert)
                            .font(.headline)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.red)
                            .clipShape(.rect(cornerRadius: 12))
                            .foregroundStyle(.white)
                    }
                    .listRowBackground(Color.clear)
                }
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle(migraineDetailsTitle)
            .alert(
                "Warning!",
                isPresented: $showingDeleteAlert,
                actions: {
                    Button("Yes", role: .destructive, action: deleteMigraine)
                },
                message: {
                    Text("Are you sure you want to delete this migraine?")
                }
            )
            .onDisappear {
                if !isMigraineSaved {
                    migraine.copy(from: originalMigraine)
                }
            }
            .toolbar {
                if isNew {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", action: cancel)
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", action: save)
                }
            }
        }
    }
    
    private func cancel() {
        dismiss()
    }
    
    private func save() {
        if isNew { modelContext.insert(migraine) }
        isMigraineSaved = true
        
        dismiss()
    }
    
    private func showDeleteAlert() {
        showingDeleteAlert = true
    }
    
    private func deleteMigraine() {
        modelContext.delete(migraine)
        
        dismiss()
    }
}

#Preview("New migraine") {
    MigraineDetails(isNew: true)
}

#Preview("Existing migraine") {
    MigraineDetails(migraine: SampleData.shared.migraine)
}
