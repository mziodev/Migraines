//
//  Date+Format.swift
//  Migraines
//
//  Created by MZiO on 3/12/24.
//

import Foundation

extension Date {
    
    var monthDay: String {
        self.formatted(.dateTime.month().day())
    }
}
