//
//  ContentView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI

struct ContentView: View {

    @State private var text: String = ""
    var body: some View {
        TabView {

            Tab("Movies", systemImage: "film") {
                MovieListView()
            }

            Tab("Favorites", systemImage: "heart") {
                FavoriteListView()
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
            Tab(role: .search) {
                NavigationStack {
                    SearchView()
                }
            }

        }

    }
}

#Preview {
    ContentView()
        .environment(FavoriteViewModel())
}
