//
//  ContentView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI

struct ContentView: View {

    @State private var text: String = ""
    @State private var movieListViewModel = MovieListViewModel()

    var body: some View {
        TabView {

            Tab("Movies", systemImage: "film") {
                MovieListView(viewModel: movieListViewModel)
            }

            Tab("Favorites", systemImage: "heart") {
                FavoriteListView(movies: movieListViewModel.movies)
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView(movies: movieListViewModel.movies)
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
