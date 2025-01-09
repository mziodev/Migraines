//
//  PalliativeDoseDetailsView.swift
//  Migraines
//
//  Created by MZiO on 3/1/25.
//

import SwiftData
import SwiftUI

struct PalliativeDoseDetailsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Bindable var migraine: Migraine
    
    @State var palliativeDose: PalliativeDose
    
    @State private var originalPalliativeDose = PalliativeDose()
    
    @State private var isPalliativeDoseSaved = false
    @State private var isPalliativeChanged = false
    @State private var showingPalliativeList = false
    @State private var showingDeleteAlert = false
    
    let isNew: Bool
    
    init(
        migraine: Migraine = Migraine(),
        palliativeDose: PalliativeDose = PalliativeDose(),
        isNew: Bool = false
    ) {
        self.migraine = migraine
        self.palliativeDose = palliativeDose
        self.isNew = isNew
    }
    
    private func cancelPalliativeDose() {
        if isPalliativeChanged {
            modelContext.delete(palliativeDose)
        }
        
        dismiss()
    }
    
    private func savePalliativeDose() {
        if isNew {
            modelContext.insert(palliativeDose)
            migraine.palliativeDoses.append(palliativeDose)
        }
        
        isPalliativeDoseSaved = true
        
        dismiss()
    }
    
    private func showDeleteAlert() {
        showingDeleteAlert = true
    }
    
    private func deletePalliativeDose() {
        modelContext.delete(palliativeDose)
        
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Palliative") {
                    HStack {
                        if palliativeDose.palliative == nil {
                            Text("Select palliative")
                        } else {
                            if let palliative = palliativeDose.palliative {
                                PalliativeListBasicRow(palliative: palliative)
                            }
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.up.chevron.down")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showingPalliativeList = true
                    }
                }
                
                Section("Amount") {
                    TextField(
                        "Amount value",
                        value: $palliativeDose.amount,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                    .overlay(alignment: .trailing) {
                        if let palliative = palliativeDose.palliative {
                            Text(palliative.format.measurementUnit)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle(isNew ? "New dose" : "Dose details")
            .overlay(alignment: .bottom) {
                if !isNew {
                    Button(
                        "Delete Palliative Dose",
                        role: .destructive,
                        action: showDeleteAlert
                    )
                    .font(.headline)
                    .padding(.bottom)
                }
            }
            .onAppear {
                if !isNew {
                    originalPalliativeDose.copy(from: palliativeDose)
                }
            }
            .onDisappear {
                if !isPalliativeDoseSaved {
                    palliativeDose.copy(from: originalPalliativeDose)
                }
            }
            .sheet(isPresented: $showingPalliativeList) {
                PalliativeListToSelectFrom(
                    palliativeDose: palliativeDose,
                    isPalliativeChanged: $isPalliativeChanged
                )
            }
            .alert("Warning!", isPresented: $showingDeleteAlert, actions: {
                Button("OK", role: .destructive, action: deletePalliativeDose)
            }, message: {
                Text("This palliative dose is going to be deleted, are you sure?")
            })
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", action: savePalliativeDose)
                }
                
                if isNew {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", action: cancelPalliativeDose)
                    }
                }
            }
        }
    }
}

#Preview("New Dose") {
    PalliativeDoseDetailsView(isNew: true)
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Existing Dose") {
    PalliativeDoseDetailsView(palliativeDose: SampleData.shared.palliativeDose)
    .modelContainer(SampleData.shared.modelContainer)
}
