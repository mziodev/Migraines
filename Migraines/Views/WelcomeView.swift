//
//  WelcomeView.swift
//  Migraines
//
//  Created by MZiO on 21/1/25.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var isFirstLaunch: Bool
    
    func goToApp() { isFirstLaunch = false }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 50) {

                Feature(
                    symbolName: "heart",
                    symbolColor: .mgFolly,
                    title: "Simple",
                    text: "Migraines is a simple, organic app with a clean and relaxing pastel colors interface."
                )
                
                Feature(
                    symbolName: "calendar.badge.clock",
                    symbolColor: .mgJade,
                    title: "Easy tracking",
                    text: "Track your migraines in a single screen and with just a few steps."
                )
                
                Feature(
                    symbolName: "pills",
                    symbolColor: .mgXanthous,
                    title: "Add your palliatives",
                    text: "Add and store your tipical crisis palliative treatments to access them quickly."
                )
                
                Spacer()
                
                Button("Continue", action: goToApp)
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .foregroundStyle(.white)
                    .background(
                        .accent,
                        in: .rect(cornerRadius: 12)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .padding()
            .padding(.top, 50)
            .navigationTitle("Welcome to Migraines")
        }
    }
}

#Preview {
    
    @State @Previewable var isFirstLaunch = true
    
    WelcomeView(isFirstLaunch: $isFirstLaunch)
}

struct Feature: View {
    let symbolName: String
    let symbolColor: Color
    let title: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: symbolName)
                .frame(width: 70)
                .font(.system(size: 40))
                .foregroundStyle(symbolColor)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                
                Text(text)
                    .foregroundStyle(.secondary)
                    .padding(.trailing)
            }
        }
    }
}
