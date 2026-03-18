//
//  SettingsView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers
import ConfettiSwiftUI
import Toasts

struct SettingsView: View {
    @AppStorage("appearance") private var selectedAppearance: Appearance = .system
    @Environment(FavoriteViewModel.self) private var favoriteViewModel: FavoriteViewModel
    @State private var csvFile: CSVFile?
    @State private var showingExporter = false
    @State private var confettiTrigger = 0
    @State private var showingDeleteConfirmation = false
    @Environment(\.presentToast) var presentToast
    
    let movies: [Movie]

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
                    Button {
                        if let csv = favoriteViewModel.favoritesCSVContent(from: movies) {
                            csvFile = CSVFile(text: csv)
                            showingExporter = true
                        } else {
                            presentToast(ToastValue(
                                icon: Image(systemName: "heart.slash"),
                                message: "No favorite movies to export"
                            ))
                        }
                    } label: {
                        Label("Export favorites", systemImage: "square.and.arrow.up")
                    }
                    
                    Button(role: .destructive) {
                        showingDeleteConfirmation = true
                    } label: {
                        Label("Delete all favorites", systemImage: "trash")
                            .foregroundStyle(.red)
                    }
                    
                    
                } header: {
                    Text("Advanced Settings")
                }
               
                  
            }
            .navigationTitle("Settings")
            .alert("Delete All Favorites", isPresented: $showingDeleteConfirmation) {
                Button("Delete", role: .destructive) {
                    favoriteViewModel.deleteAllFavorites()
                    presentToast(ToastValue(
                        icon: Image(systemName: "checkmark.circle.fill"),
                        message: "All favorites deleted"
                    ))
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure you want to delete all your favorites? This action cannot be undone.")
            }
            .fileExporter(
                isPresented: $showingExporter,
                document: csvFile,
                contentType: .commaSeparatedText,
                defaultFilename: "favorites.csv"
            ) { result in
                switch result {
                case .success:
                    confettiTrigger += 1
                    presentToast(ToastValue(
                        icon: Image(systemName: "checkmark.circle.fill"),
                        message: "Favorites exported successfully"
                    ))
                case .failure(let error):
                    presentToast(ToastValue(
                        icon: Image(systemName: "xmark.circle.fill"),
                        message: "Export failed: \(error.localizedDescription)"
                    ))
                }
            }
            .confettiCannon(
                trigger: $confettiTrigger,
                confettis: [.text("🎉"), .text("😍"), .shape(.circle), .shape(.triangle)],
                rainHeight: 600,
                radius: 300
            )
        }
    }
}

#Preview {
    SettingsView(movies: [])
        .environment(FavoriteViewModel())
        .modelContainer(for: [Movie.self, Person.self], inMemory: true)
}
