//
//  PalliativeDetailsView.swift
//  Migraines
//
//  Created by MZiO on 2/1/25.
//

import SwiftData
import SwiftUI

struct PalliativeDetailsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Bindable var palliative: Palliative
    
    @State private var originalPalliative = Palliative()
    @State private var showingDeleteAlert = false
    @State private var isPalliativeSaved = false
    
    @FocusState private var isPalliativeNameFocused: Bool
    
    let isNew: Bool
    
    init(palliative: Palliative = Palliative(), isNew: Bool = false) {
        self.palliative = palliative
        self.isNew = isNew
    }
    
    private func showDeleteAlert() {
        showingDeleteAlert = true
    }
    
    private func savePalliative() {
        if isNew {
            modelContext.insert(palliative)
        }
        
        isPalliativeSaved = true
        
        dismiss()
    }
    
    private func cancelPalliative() {
        dismiss()
    }
    
    private func deletePalliative() {
        modelContext.delete(palliative)
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        
                        Image(systemName: palliative.format.imageName)
                            .font(.system(size: 80))
                            .frame(height: 80)
                            .foregroundStyle(.accent)
                        
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                .padding(.top)
                
                Section("Name") {
                    TextField("Enter a name", text: $palliative.name)
                        .focused($isPalliativeNameFocused)
                        .autocapitalization(.words)
                }
                
                Section("Concentration") {
                    HStack {
                        TextField(
                            "Concentration value",
                            value: $palliative.concentration,
                            format: .number
                        )
                        
                        Picker(
                            "",
                            selection: $palliative.concentrationUnits
                        ) {
                            ForEach(
                                ConcentrationUnits.allCases,
                                id: \.self
                            ) { unit in
                                Text(unit.localizedName)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                
                Section("Type & Format") {
                    Picker("Type", selection: $palliative.type) {
                        ForEach(PalliativeType.allCases, id: \.self) { type in
                            Text(type.localizedName)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Format", selection: $palliative.format) {
                        ForEach(PalliativeFormat.allCases, id: \.self) { format in
                            Text(format.localizedName)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                if !isNew {
                    Section {
                        HStack {
                            Spacer()
                            
                            Button(
                                "Delete Palliative",
                                role: .destructive,
                                action: showDeleteAlert
                            )
                            
                            Spacer()
                        }
                        .padding(.top, 50)
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle(isNew ? "New Palliative" : "Palliative Details")
            .onAppear {
                originalPalliative.copy(from: palliative)
            }
            .onDisappear {
                if !isPalliativeSaved {
                    palliative.copy(from: originalPalliative)
                }
            }
            .alert("Warning!", isPresented: $showingDeleteAlert, actions: {
                Button("Delete", role: .destructive) {
                    deletePalliative()
                }
            }, message: {
                Text("This palliative treatment will be deleted, are you sure?")
            })
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", action: savePalliative)
                }
                
                if isNew {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", action: cancelPalliative)
                    }
                }
            }
        }
    }
}

#Preview("New Palliative") {
    PalliativeDetailsView(isNew: true)
}

#Preview("Existing Palliative") {
    PalliativeDetailsView(palliative: SampleData.shared.palliative)
}
