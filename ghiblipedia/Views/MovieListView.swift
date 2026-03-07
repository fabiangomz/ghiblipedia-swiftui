//
//  MovieListView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI

struct MovieListView: View {
    
    let urlSessionManager = URLSessionManager.shared
    
    @State private var movies: [Movie] = []
    
    var body: some View {
        List(movies) { movie in
            Text(movie.title)
            
            
        }.task {
            movies = try! await urlSessionManager.getMovies()
        }
    }
}

#Preview {
    MovieListView()
}
