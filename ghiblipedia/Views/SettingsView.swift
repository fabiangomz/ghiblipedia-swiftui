//
//  SettingsView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("appearance") private var selectedAppearance: Appearance = .system

    var body: some View {
        NavigationStack {
            Form {
              
                Section {
                    Picker("Appearance", selection: $selectedAppearance) {
                        ForEach(Appearance.allCases) { mode in
                            Text(mode.rawValue).tag(mode)
                        }
                    }
                } header: {
                    Text("Appearance")
                }
                
                Section {
                    Button {} label: {
                        
                        Label("Export favorites", systemImage: "square.and.arrow.up") }
                    
              
                    Button(role: .destructive) {
                        
                    } label: {
                        Label("Delete all favorites", systemImage: "trash")
                            .foregroundStyle(.red)
                    }
                    
                    
                } header: {
                    Text("Advanced Settings")
                }
               
                  
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
