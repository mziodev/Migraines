//
//  Migraine+SampleData.swift
//  Migraines
//
//  Created by MZiO on 9/12/24.
//

import Foundation

extension Migraine {
    
    /// A collection of sample `Migraine` instances for testing or demonstration purposes.
    ///
    /// This static property provides a predefined set of `Migraine` objects with varying dates
    /// and severity levels. It can be used to populate user interfaces or for testing purposes
    /// without needing to create real data.
    static var sampleData: [Migraine] = [
        Migraine(date: .now - 84600 * 43, level: .moderate),
        Migraine(date: .now - 84600 * 42, level: .extreme),
        Migraine(date: .now - 84600 * 35, level: .intense),
        Migraine(date: .now - 84600 * 15, level: .moderate),
        Migraine(date: .now - 84600 * 14, level: .intense),
        Migraine(date: .now - 84600 * 7, level: .mild),
        Migraine(date: .now - 84600 * 6, level: .extreme),
        Migraine(date: .now - 84600 * 2, level: .mild),
    ]
}
