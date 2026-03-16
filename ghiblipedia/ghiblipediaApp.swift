//
//  ghiblipediaApp.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI

@main
struct ghiblipediaApp: App {

    @AppStorage("appearance") private var selectedAppearance: Appearance =
        .system
    @State private var favoriteViewModel = FavoriteViewModel()

    var colorScheme: ColorScheme? {
        switch selectedAppearance {
        case .light: return .light
        case .dark: return .dark
        case .system: return nil
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(favoriteViewModel)
                .preferredColorScheme(colorScheme)
        }
    }
}
