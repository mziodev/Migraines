//
//  MigraineDetailsLevelSelectorView.swift
//  Migraines
//
//  Created by MZiO on 4/12/24.
//

import SwiftUI

struct MigraineDetailsLevelSelectorView: View {
    @Binding var migraine: Migraine
    
    var body: some View {
        VStack {
            VStack(alignment: .trailing, spacing: 5) {
                Text(migraine.level.name)
                    .font(.headline.smallCaps())
                    .foregroundStyle(
                        migraine.level.backgroundColor
                    )
                    .padding(.horizontal, 5)
                
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 10)
                    .foregroundStyle(migraine.level.backgroundColor)
            }
            
            Picker("Migraine level", selection: $migraine.level) {
                ForEach(MigraineLevel.allCases, id: \.self) { level in
                    Text("\(level.rawValue)")
                }
            }
            .pickerStyle(.palette)
        }
    }
}

#Preview {
    List {
        MigraineDetailsLevelSelectorView(
            migraine: .constant(SampleData.shared.migraine)
        )
    }
}
