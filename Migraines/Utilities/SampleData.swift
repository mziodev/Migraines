//
//  SampleData.swift
//  Migraines
//
//  Created by MZiO on 10/12/24.
//

import Foundation
import SwiftData

/// A singleton class that manages sample data for the application.
/// This class provides a model container and context for managing `Migraine` data.
@MainActor
class SampleData {
    
    /// The shared instance of `SampleData`.
    static let shared = SampleData()
    
    /// The model container that holds the data model.
    let modelContainer: ModelContainer
    
    /// The main context for the model container, used for data operations.
    var modelContext: ModelContext {
        modelContainer.mainContext
    }
    
    /// A sample `Migraine` instance from the sample data.
    var migraine: Migraine {
        Migraine.sampleData[0]
    }
    
    /// Private initializer to set up the model container and insert sample data.
    private init() {
        let schema = Schema([
            Migraine.self,
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true
        )

        do {
            modelContainer = try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    /// Inserts sample data into the model context.
    /// This method iterates over the sample data and saves it to the model context.
    private func insertSampleData() {
        Migraine.sampleData.forEach {
            modelContext.insert($0)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Sample data modelContext failed to save.")
        }
    }
}
