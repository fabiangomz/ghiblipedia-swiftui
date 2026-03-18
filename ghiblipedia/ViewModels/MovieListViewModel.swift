//
//  MovieListViewModel.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 7/3/26.
//

import Foundation

@Observable
class MovieListViewModel {
    
    var movies: [Movie] = []
    var searchText: String = ""
    var isLoading = false
    var errorMessage: String?

    var filteredMovies: [Movie] {
        if searchText.isEmpty { return movies }
        else {
            return movies.filter { movie in
                movie.title.localizedCaseInsensitiveContains(searchText) ||
                movie.originalTitle.localizedCaseInsensitiveContains(searchText) ||
                movie.director.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    func fetchMovies() async {
        isLoading = true 
        errorMessage = nil

        do {
            movies = try await URLSessionManager.shared.getMovies()
            //print(movies)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
