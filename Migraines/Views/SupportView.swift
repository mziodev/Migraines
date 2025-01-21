//
//  SupportView.swift
//  Migraines
//
//  Created by MZiO on 21/1/25.
//

import SwiftUI

struct SupportView: View {
    @Environment(\.dismiss) private var dismiss
    
    let appVersionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    
    private func dismissView() { dismiss() }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        Link(
                            "mziodev@gmail.com",
                            destination: URLs.email
                        )
                    } header: {
                        Text("Contact Us")
                    } footer: {
                        Text("Report a problem or just send us some feedback.")
                            .font(.caption.italic())
                    }
                    
                    Section("Policies") {
                        Link(
                            "Privacy Policy",
                            destination: URLs.privacyPolicy
                        )
                        
                        Link(
                            "Terms of Service (EULA)",
                            destination: URLs.termsOfUse
                        )
                    }
                    
                    Section("About Migraines") {
                        AppInfo(
                            text: String(localized: "Version number:"),
                            number: appVersionNumber
                        )
                    }
                }
                .overlay {
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Text(
                                "©\(Date.now.year) Mauricio Del Solar (MZiO)"
                            )
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                            Spacer()
                            
                        }
                    }
                }
            }
            .navigationTitle("Support")
            .toolbar {
                ToolbarItem {
                    Button("Ok", action: dismissView)
                }
            }
        }
    }
}

#Preview {
    SupportView()
}

struct AppInfo: View {
    let text: String
    let number: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(text)
            
            Text(number)
                .fontDesign(.rounded)
                .bold()
                .foregroundStyle(.mgJade)
        }
    }
}
