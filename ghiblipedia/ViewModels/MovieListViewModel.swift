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
    var isLoading = false
    var errorMessage: String?

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
