//
//  ContentView.swift
//  Migraines
//
//  Created by MZiO on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentMonth = Calendar.current.component(.month, from: .now)
    @State private var currentYear = Calendar.current.component(.year, from: .now)
    @State private var showingAddMigrane: Bool = false
    
    private let monthSymbols = Calendar.current.monthSymbols
    
    private var contentViewTitle: String {
        monthSymbols[currentMonth - 1] + ", \(currentYear)"
    }
    
    private func addMigraine() {
        showingAddMigrane = true
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                MigraineCalendarControlBar(
                    currentMonth: $currentMonth,
                    currentYear: $currentYear
                )
                
                MigraineCalendar(
                    currentMonth: $currentMonth,
                    currentYear: $currentYear
                )
                
                Button("Add Migraine", action: addMigraine)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.accentColor)
                    .clipShape(.rect(cornerRadius: 12))
                    .foregroundStyle(.white)
                    .padding()
            }
            .padding(.horizontal)
            .navigationTitle(contentViewTitle)
            .sheet(isPresented: $showingAddMigrane) {
                MigraineDetails(isNew: true)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
