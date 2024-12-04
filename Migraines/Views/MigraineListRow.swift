//
//  MigraineListRow.swift
//  Migraines
//
//  Created by MZiO on 4/12/24.
//

import SwiftUI

struct MigraineListRow: View {
    let migraine: Migraine
    
    var body: some View {
        HStack {
            Text(migraine.date.monthDay)
            
            Spacer()
            
            Text(migraine.level.name)
            
            Circle()
                .frame(width: 22, height: 22)
                .foregroundStyle(migraine.level.backgroundColor)
        }
    }
}

#Preview {
    List {
        MigraineListRow(migraine: SampleData.shared.migraine)
    }
}
