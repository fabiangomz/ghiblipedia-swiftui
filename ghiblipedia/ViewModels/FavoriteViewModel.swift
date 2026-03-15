//
//  FavoriteViewModel.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 15/3/26.
//

import Foundation

@Observable
class FavoriteViewModel {

    var favoriteIDs: [String] = []

    private let favoritesKey = "favoriteMovieIDs"

    init() {
        favoriteIDs = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
    }

    func isFavorite(_ movie: Movie) -> Bool {
        favoriteIDs.contains(movie.id)
    }

    func toggleFavorite(_ movie: Movie) {
        if isFavorite(movie) {
            favoriteIDs.removeAll { id in id == movie.id }
        } else {
            favoriteIDs.append(movie.id)
        }
        UserDefaults.standard.set(favoriteIDs, forKey: favoritesKey)
    }
}

