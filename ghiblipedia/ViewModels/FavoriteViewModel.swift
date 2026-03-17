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
    
    func favoritesCSVContent(from movies: [Movie]) -> String? {
        let favorites = movies.filter { movie in favoriteIDs.contains(movie.id) }
        if favorites.isEmpty { return nil }

        var csv = "Title,Director,Producer,Release Date,Score,Duration\n"
        for movie in favorites {
            let fields = [movie.title, movie.director, movie.producer, movie.releaseDate, movie.score, movie.duration]
            let escapedFields = fields.map { field in
                let escaped = field.replacingOccurrences(of: "\"", with: "\"\"")
                return "\"\(escaped)\""
            }
            let row = escapedFields.joined(separator: ",")
            csv.append(row + "\n")
        }

        return csv
    }
    
    func deleteAllFavorites() {
        favoriteIDs.removeAll()
        UserDefaults.standard.removeObject(forKey: favoritesKey)
    }
}

