//
//  MovieListViewModel.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 7/3/26.
//

import Foundation
import SwiftData

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

    func fetchMovies(modelContext: ModelContext) async {
        let cached = (try? modelContext.fetch(FetchDescriptor<Movie>())) ?? []
        
        if !cached.isEmpty {
            movies = cached
            return
        }
        
        isLoading = true
        errorMessage = nil

        do {
            let responses = try await URLSessionManager.shared.getMovies()
            
            for response in responses {
                modelContext.insert(Movie(from: response))
            }
            try modelContext.save()
            
            movies = (try? modelContext.fetch(FetchDescriptor<Movie>())) ?? []
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
