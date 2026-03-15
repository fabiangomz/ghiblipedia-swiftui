//
//  ghiblipediaApp.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI

@main
struct ghiblipediaApp: App {
    
    @State private var favoriteViewModel = FavoriteViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(favoriteViewModel)
        }
    }
}
