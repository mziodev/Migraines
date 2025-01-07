//
//  PalliativeListBasicRow.swift
//  Migraines
//
//  Created by MZiO on 3/1/25.
//

import SwiftUI

struct PalliativeListBasicRow: View {
    
    let palliative: Palliative
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: palliative.format.imageName)
                .frame(width: 30)
                .font(.title2)
                .foregroundStyle(.mgJade)
            
            VStack(alignment: .leading) {
                Text(palliative.name)
                    .font(.headline)
                
                Text(palliative.concentrationInfo)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    List {
        PalliativeListBasicRow(palliative: SampleData.shared.palliative)
    }
}
