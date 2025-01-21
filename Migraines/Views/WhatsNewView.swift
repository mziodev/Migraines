//
//  WhatsNewView.swift
//  Migraines
//
//  Created by MZiO on 21/1/25.
//

import SwiftUI

struct WhatsNewView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    private func dismissView() { dismiss() }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Version 1.0") {
                    UpdateItemView(text: "Simple, organic interface with relaxing pastel colors.")
                    
                    UpdateItemView(text: "Track your migraines in a single screen and with just a few steps.")
                    
                    UpdateItemView(text: "Add and store your tipical crisis palliative treatments to access them quickly.")
                }
            }
            .navigationTitle("What's New")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Ok", action: dismissView)
                }
            }
        }
    }
}

#Preview {
    WhatsNewView()
}

struct UpdateItemView: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top ,spacing: 5) {
            Image(systemName: "checkmark.square.fill")
                .font(.title3)
                .bold()
                .foregroundStyle(.mgJade)
            
            Text(text)
        }
        .listRowBackground(Color.clear)
    }
}
