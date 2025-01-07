//
//  MigrainesApp.swift
//  Migraines
//
//  Created by MZiO on 9/12/24.
//

import SwiftData
import SwiftUI

@main
struct MigrainesApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Migraine.self,
            Palliative.self,
            PalliativeDose.self,
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        
        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
