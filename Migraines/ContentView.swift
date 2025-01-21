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
    
    @AppStorage("FirstStart") private var isFirstLaunch: Bool = true
    
    @State private var currentMonth = Date.now.month
    @State private var currentYear = Date.now.year
    
    @State private var showingAddMigrane = false
    @State private var showingPalliativeList = false
    @State private var showingSupportView = false
    @State private var showingWhatsNewView = false
    
    private let monthSymbols = Calendar.current.monthSymbols
    
    private var contentViewTitle: String {
        monthSymbols[currentMonth - 1] + ", \(currentYear)"
    }
    
    private func addMigraine() {
        showingAddMigrane = true
    }
    
    private func showPalliativeList() {
        showingPalliativeList = true
    }
    
    private func showSupportView() {
        showingSupportView = true
    }
    
    private func showWhatsNewView() {
        showingWhatsNewView = true
    }
    
    private func rateThisApp() {
        let url = URLs.writeReview
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("Could not open URL \(url)")
        }
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
            .sheet(isPresented: $isFirstLaunch) {
                WelcomeView(isFirstLaunch: $isFirstLaunch)
            }
            .sheet(isPresented: $showingAddMigrane) {
                MigraineDetailsView(isNew: true)
            }
            .sheet(isPresented: $showingPalliativeList) {
                PalliativeList()
            }
            .sheet(isPresented: $showingSupportView) {
                SupportView()
            }
            .sheet(isPresented: $showingWhatsNewView) {
                WhatsNewView()
            }
            .toolbar {
                Menu("Menu", systemImage: "ellipsis.circle") {
                    Button(action: showPalliativeList) {
                        Label("My palliatives", systemImage: "pills")
                    }
                    
                    Section {
                        Button(action: showWhatsNewView) {
                            Label("What's New", systemImage: "sparkles")
                        }
                        
                        Button(action: rateThisApp) {
                            Label("Rate this app", systemImage: "star")
                        }
                    }
                    
                    Button(action: showSupportView) {
                        Label("Support", systemImage: "envelope")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
