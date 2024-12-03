//
//  MigraineList.swift
//  Migraines
//
//  Created by MZiO on 3/12/24.
//

import SwiftData
import SwiftUI

struct MigraineList: View {
    @Query(sort: \Migraine.date, order: .reverse) private var migraines: [Migraine]
    
    var body: some View {
        NavigationStack {
            List(migraines) { migraine in
                HStack {
                    Text(migraine.date.monthDay)
                    
                    Spacer()
                    
                    Text(migraine.level.name)
                    
                    Circle()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(migraine.level.backgroundColor)
                }
            }
            .navigationTitle("Migraine list")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Text("\(migraines.count) migraines")
                }
            }
        }
    }
}

#Preview {
    MigraineList()
        .modelContainer(SampleData.shared.modelContainer)
}
