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
    
    var migraine: Migraine {
        Migraine.sampleData[0]
    }
    
    var palliative: Palliative {
        Palliative.sampleData[0]
    }
    
    var palliativeDose: PalliativeDose {
        PalliativeDose.sampleData[0]
    }
    
    /// Private initializer to set up the model container and insert sample data.
    private init() {
        let schema = Schema([
            Migraine.self,
            Palliative.self,
            PalliativeDose.self,
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
        
        Palliative.sampleData.forEach {
            modelContext.insert($0)
        }
        
        PalliativeDose.sampleData.forEach {
            modelContext.insert($0)
        }
        
        // Palliative-PalliativeDose relationships
        Palliative.sampleData[0].doses.append(PalliativeDose.sampleData[0])
        Palliative.sampleData[0].doses.append(PalliativeDose.sampleData[4])
        Palliative.sampleData[1].doses.append(PalliativeDose.sampleData[1])
        Palliative.sampleData[1].doses.append(PalliativeDose.sampleData[2])
        Palliative.sampleData[1].doses.append(PalliativeDose.sampleData[3])
        Palliative.sampleData[1].doses.append(PalliativeDose.sampleData[5])
        Palliative.sampleData[1].doses.append(PalliativeDose.sampleData[6])
        
        // Migraine-PalliativeDose relationships
        Migraine.sampleData[0].palliativeDoses.append(PalliativeDose.sampleData[0])
        Migraine.sampleData[0].palliativeDoses.append(PalliativeDose.sampleData[1])
        Migraine.sampleData[1].palliativeDoses.append(PalliativeDose.sampleData[2])
        Migraine.sampleData[2].palliativeDoses.append(PalliativeDose.sampleData[3])
        Migraine.sampleData[3].palliativeDoses.append(PalliativeDose.sampleData[4])
        Migraine.sampleData[4].palliativeDoses.append(PalliativeDose.sampleData[5])
        Migraine.sampleData[6].palliativeDoses.append(PalliativeDose.sampleData[6])
        
        do {
            try modelContext.save()
        } catch {
            print("Sample data modelContext failed to save.")
        }
    }
}
