//
//  Migraine+SampleData.swift
//  Migraines
//
//  Created by MZiO on 3/12/24.
//

import Foundation

extension Migraine {
    static let sampleData: [Migraine] = [
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
