//
//  PalliativeList.swift
//  Migraines
//
//  Created by MZiO on 30/12/24.
//

import SwiftData
import SwiftUI

struct PalliativeList: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Palliative.name) private var palliatives: [Palliative]
    
    @State private var showingAddPalliative = false
    
    private func dismissView() {
        dismiss()
    }
    
    private func showAddPalliative() {
        showingAddPalliative = true
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(palliatives) { palliative in
                    NavigationLink {
                        PalliativeDetailsView(palliative: palliative)
                    } label: {
                        PalliativeListBasicRow(palliative: palliative)
                    }
                }
            }
            .navigationTitle("My palliatives")
            .sheet(isPresented: $showingAddPalliative) {
                PalliativeDetailsView(isNew: true)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done", action: dismissView)
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button(action: showAddPalliative) {
                        Label("Add palliative", systemImage: "plus")
                    }
                }
                
                ToolbarItem(placement: .status) {
                    Text("\(palliatives.count) palliatives")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    PalliativeList()
        .modelContainer(SampleData.shared.modelContainer)
}
