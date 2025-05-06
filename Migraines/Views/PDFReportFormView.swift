//
//  PDFReportFormView.swift
//  Migraines
//
//  Created by MZiO on 25/2/25.
//

import SwiftData
import SwiftUI

struct PDFReportFormView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Migraine.date) var migraines: [Migraine]
    
    @State private var timeRange: TimeRange = .lastMonth
    @State private var filteredMigraines: [Migraine] = []
    
    private func loadFilteredMigraines() {
        let startDate = timeRange.startDate

        let predicate = #Predicate<Migraine> { migraine in
            migraine.date >= startDate
        }

        do {
            var descriptor = FetchDescriptor<Migraine>(predicate: predicate)
            descriptor.sortBy = [SortDescriptor(\.date, order: .forward)]
            
            filteredMigraines = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch error: \(error)")
            filteredMigraines = []
        }
    }
    
    private func generateTemporaryPDFURL() -> URL {
        let pdfView = PDFReportView(migraines: migraines)
        
        guard let data = pdfView.renderToPDF() else {
            print("❌ PDF Rendering Failed")
            return URL(fileURLWithPath: "") // Handle errors properly
        }
        
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent(
            "migraines-\(timeRange.rawValue).pdf"
        )
        
        do {
            try data.write(to: tempURL)
            print("✅ Temporary PDF saved to: \(tempURL.path)")
            return tempURL
        } catch {
            print("❌ File Save Error: \(error)")
            return URL(fileURLWithPath: "")
        }
    }
    
    private func exportPDF() {
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        Picker("Choose Time Range", selection: $timeRange) {
                            ForEach(TimeRange.allCases, id: \.self) { range in
                                Text(range.localizedDescription)
                            }
                        }
                    }
                    
                    Section {
                        List(filteredMigraines, id: \.self) { migraine in
                            VStack(alignment: .leading) {
                                Text(migraine.notes)
                                Text(migraine.date.formatted())
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                ShareLink(
                    item: generateTemporaryPDFURL(),
                    preview: SharePreview(
                        "Migraine Report",
                        image: Image(systemName: "doc.text")
                    )
                )
            }
            .navigationTitle("Migraines Report")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: loadFilteredMigraines)
            .onChange(of: timeRange) {
                loadFilteredMigraines()
            }
        }
    }
}

#Preview {
    PDFReportFormView()
        .modelContainer(SampleData.shared.modelContainer)
}
