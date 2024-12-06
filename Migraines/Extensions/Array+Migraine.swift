//
//  Array+Migraine.swift
//  Migraines
//
//  Created by MZiO on 4/12/24.
//

import Foundation

extension Array where Element: Migraine {
    
    func filterByMonth(_ month: Int, year: Int) -> [Element] {
        self.filter { $0.date.month == month && $0.date.year == year }
    }
}
