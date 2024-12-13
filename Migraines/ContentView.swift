//
//  ContentView.swift
//  Migraines
//
//  Created by MZiO on 9/12/24.
//

import SwiftUI

/// ContentView is the main view of the migraine tracking application.
///
/// This view displays a calendar interface for users to log and view their
/// migraine occurrences.
///
/// - Properties:
///   - `currentMonth`: The month currently displayed in the calendar.
///   - `currentYear`: The year currently displayed in the calendar.
///   - `showingAddMigrane`: A Boolean flag indicating whether the add migraine
///   sheet is presented.
///
/// - Methods:
///   - `addMigraine()`: Triggers the presentation of the add migraine sheet.
///
/// - Usage:
///   This view integrates with `MigraineCalendarControlBar` and `MigraineCalendar`
///   to provide a complete user experience for tracking migraines. The
///   "Add Migraine" button allows users to input new migraine entries.
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
                Spacer()
                
                MigraineCalendarControlBar(
                    currentMonth: $currentMonth,
                    currentYear: $currentYear
                )
                
                MigraineCalendar(
                    currentMonth: $currentMonth,
                    currentYear: $currentYear
                )
                
                Spacer()
                
                Button("Add Migraine", action: addMigraine)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.accentColor)
                    .clipShape(.rect(cornerRadius: 12))
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .padding(.bottom, 30)
            }
            .padding(.horizontal)
            .navigationTitle(contentViewTitle)
            .sheet(isPresented: $showingAddMigrane) {
                MigraineDetailsView(isNew: true)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
