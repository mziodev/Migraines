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
    
    @Binding var isPalliativeChanged: Bool
    
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
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done", action: dismissView)
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
