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
            .overlay {
                if palliatives.isEmpty {
                    PalliativeListEmptyView()
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
                    Button(action: showAddPalliative) {
                        Label("Add palliative", systemImage: "plus")
                    }
                }
                
                if !palliatives.isEmpty {
                    ToolbarItem(placement: .status) {
                        Text("\(palliatives.count) palliatives")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
}

#Preview("Withou any palliatives") {
    PalliativeList()
}

#Preview("With some palliatives") {
    PalliativeList()
        .modelContainer(SampleData.shared.modelContainer)
}

struct PalliativeListEmptyView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "cross.case")
                .font(.system(size: 60))
                .foregroundStyle(.accent.opacity(0.4))
            
            VStack(spacing: 5) {
                Text("No palliatives yet")
                    .font(.title2)
                    .bold()
                
                Text(
                    "Tap the plus button above to add a new palliative."
                )
                .font(.caption)
                .foregroundStyle(.secondary)
            }
        }
    }
}
