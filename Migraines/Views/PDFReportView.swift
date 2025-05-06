//
//  PDFReportView.swift
//  Migraines
//
//  Created by MZiO on 13/2/25.
//

import SwiftUI

struct PDFReportView: View {
    
    let migraines: [Migraine]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // header to verify layout
            Text("Migraine History")
                .font(.headline)
                .padding(.bottom, 10)
            
            ForEach(migraines) { migraine in
                HStack(spacing: 10) {
                    Text(migraine.date.monthDay)
                        .font(.system(size: 10))
                        .frame(width: 50, alignment: .leading)
                    
                    Text(migraine.level.localizedName)
                        .font(.system(size: 11, weight: .bold))
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .foregroundStyle(migraine.level.foregroundColor)
                        .background(
                            migraine.level.backgroundColor,
                            in: RoundedRectangle(cornerRadius: 4)
                        )
                }
                .padding(.vertical, 2)
            }
        }
        .padding(20)
        .frame(width: 595, height: 842, alignment: .top)
        .background(.white)
    }
}

#Preview {
    PDFReportView(migraines: Migraine.sampleData)
}
