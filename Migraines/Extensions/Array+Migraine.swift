//
//  Array+Migraine.swift
//  Migraines
//
//  Created by MZiO on 12/12/24.
//

import Foundation

extension Array where Element: Migraine {
    
    /// Filters the array to include only migraines that occurred in the
    /// specified month and year.
    ///
    /// - Parameters:
    ///   - month: The month (1-12) for which to filter migraines.
    ///   - year: The year for which to filter migraines.
    /// - Returns: An array of `Element` (conforming to `Migraine`) that
    ///   occurred in the specified month and year.
    ///
    /// ### Usage Example
    /// ```swift
    /// let migraines: [Migraine] = [/* array of Migraine objects */]
    /// let filteredMigraines = migraines.filterByMonth(3, year: 2023)
    /// // filteredMigraines now contains only those migraines from March 2023.
    /// ```
    func filterByMonth(_ month: Int, year: Int) -> [Element] {
        self.filter { $0.date.month == month && $0.date.year == year }
    }
}
