//
//  PalliativeListToSelectFrom.swift
//  Migraines
//
//  Created by MZiO on 7/1/25.
//

import SwiftData
import SwiftUI

struct PalliativeListToSelectFrom: View {

    @Environment(\.dismiss) private var dismiss
    
    @Query(sort: \Palliative.name) private var palliatives: [Palliative]
    
    @State var palliativeDose: PalliativeDose
    
    @State private var showingAddPalliative = false
    
    @Binding var isPalliativeChanged: Bool
    
    private func addPalliative() {
        showingAddPalliative = true
    }
    
    private func saveSelectedPalliative(palliative: Palliative) {
        palliativeDose.palliative = palliative
        isPalliativeChanged = true
        
        dismiss()
    }
    
    private func dismissView() {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(palliatives) { palliative in
                    HStack {
                        PalliativeListBasicRow(palliative: palliative)
                        
                        Spacer()
                        
                        if palliativeDose.palliative == palliative {
                            Image(systemName: "checkmark")
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        saveSelectedPalliative(palliative: palliative)
                    }
                }
            }
            .sheet(isPresented: $showingAddPalliative) {
                PalliativeDetailsView(isNew: true)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done", action: dismissView)
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button(action: addPalliative) {
                        Label("Add palliative", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    PalliativeListToSelectFrom(
        palliativeDose: SampleData.shared.palliativeDose,
        isPalliativeChanged: .constant(false)
    )
    .modelContainer(SampleData.shared.modelContainer)
}
