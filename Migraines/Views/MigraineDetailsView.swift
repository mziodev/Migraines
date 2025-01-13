//
//  MigraineDetailsView.swift
//  Migraines
//
//  Created by MZiO on 10/12/24.
//

import SwiftData
import SwiftUI

/// A view that displays and allows editing of migraine details.
///
/// This view provides a user interface for entering and modifying the details
/// of a migraine, including the date, severity level, and additional notes. It
/// supports both creating a new migraine entry and editing an existing one.
///
/// ## Properties
/// - `dismiss`: An environment variable that allows dismissing the view.
/// - `modelContext`: An environment variable that provides access to the model
/// context for data operations.
/// - `migraine`: The `Migraine` instance being edited or created.
/// - `originalMigraine`: A backup of the original migraine instance to restore
/// if changes are not saved.
/// - `isMigraineSaved`: A state variable that tracks whether the migraine has
/// been saved.
/// - `showingDeleteAlert`: A state valiable that tracks if delete migraine
/// alert is showed or not.
/// - `isNew`: A boolean indicating whether the view is for creating a new
/// migraine or editing an existing one.
///
/// ## Methods
/// - `cancelNewMigraine()`: Dismisses the view without saving changes.
/// - `saveMigraine()`: Saves the migraine to the model context and dismisses
/// the view.
/// - `showDeleteAlert`: Show the delete alert message when user taps Delete Migraine button.
/// - `deleteMigraine`: Deletes the current migraine after user confirms the
/// alert message tapping the OK button.
///
/// ## User Interaction
/// Users can select a date for the migraine, choose a severity level from a
/// picker, and enter notes about their experience. The view provides "Cancel"
/// and "Save" buttons in the toolbar for user actions.
/// If the user cancels without saving, the original migraine details are restored.
///
/// ## Example
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         MigraineDetailsView(isNew: true)
///     }
/// }
/// ```
struct MigraineDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Bindable var migraine: Migraine
    
    @State private var originalMigraine = Migraine()
    
    @State private var isMigraineSaved = false
    @State private var showingDeleteAlert = false
    @State private var showingAddPalliative = false
    
    let isNew: Bool
    
    init(migraine: Migraine = Migraine(), isNew: Bool = false) {
        self.migraine = migraine
        self.isNew = isNew
    }
    
    private func cancelNewMigraine() { dismiss() }
    
    private func saveMigraine() {
        if isNew {
            modelContext.insert(migraine)
        }
        
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
    
    private func addPalliative() {
        showingAddPalliative = true
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Date") {
                    DatePicker(
                        "Migraine date",
                        selection: $migraine.date,
                        in: Date.distantPast...Date.now,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                }
                
                Section("Level") {
                    VStack(alignment: .trailing, spacing: 5) {
                        Text(migraine.level.localizedName)
                            .font(.headline.smallCaps())
                            .foregroundStyle(
                                migraine.level.backgroundColor
                            )
                            .padding(.horizontal, 5)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 10)
                            .foregroundStyle(migraine.level.backgroundColor)
                    }
                    
                    Picker(
                        "Migraine level",
                        selection: $migraine.levelID
                    ) {
                        ForEach(1..<5, id: \.self) { level in
                            Text(level, format: .number)
                        }
                    }
                    .pickerStyle(.palette)
                }
                
                Section("Palliatives") {
                    if !migraine.palliativeDoses.isEmpty {
                        ForEach(migraine.palliativeDoses) { dose in
                            if let palliative = dose.palliative {
                                NavigationLink {
                                    PalliativeDoseDetailsView(
                                        palliativeDose: dose
                                    )
                                } label: {
                                    HStack {
                                        PalliativeListBasicRow(
                                            palliative: palliative
                                        )
                                        
                                        Spacer()
                                        
                                        HStack(alignment: .bottom, spacing: 2) {
                                            Text(dose.amount, format: .number)
                                                .font(.title3)
                                                .fontDesign(.rounded)
                                            
                                            Text(
                                                palliative.format.measurementUnit
                                            )
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                            .padding(.bottom, 2)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button("Add Palliative Dose", action: addPalliative)
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .listRowBackground(Color.accent)
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
                        HStack {
                            Spacer()
                            
                            Button(
                                "Delete Migraine",
                                role: .destructive,
                                action: showDeleteAlert
                            )
                            .font(.headline)
                            
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle(isNew ? "New migraine" : "Migraine details")
            .onAppear {
                originalMigraine.copy(from: migraine)
            }
            .onDisappear {
                if !isMigraineSaved {
                    migraine.copy(from: originalMigraine)
                }
            }
            .sheet(isPresented: $showingAddPalliative) {
                PalliativeDoseDetailsView(migraine: migraine, isNew: true)
            }
            .alert(
                "Warning!",
                isPresented: $showingDeleteAlert,
                actions: {
                    Button("OK", role: .destructive, action: deleteMigraine)
                },
                message: {
                Text("This migraine will be deleted, are you sure?")
            })
            .toolbar {
                if isNew {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", action: cancelNewMigraine)
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", action: saveMigraine)
                }
            }
        }
    }
}

#Preview("New migraine") {
    MigraineDetailsView(isNew: true)
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Existing migraine") {
    MigraineDetailsView(migraine: SampleData.shared.migraine)
        .modelContainer(SampleData.shared.modelContainer)
}
