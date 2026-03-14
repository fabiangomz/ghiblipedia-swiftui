//
//  MovieListView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI

struct MovieListView: View {

    @State private var vm = MovieListViewModel()

    var body: some View {
        NavigationStack {
            List(vm.movies) { movie in
                NavigationLink(value: movie) {
                    HStack(spacing: 12) {
                        AsyncImage(url: URL(string: movie.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                        }
                        
                        .frame(width: 80, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.originalTitle)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Text(movie.releaseDate)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                        
                    }
                    .padding(.vertical, )
                }
                
            }.task {
                await vm.fetchMovies()
                
            }
            // Importante usar navigation destination porque si no se cargan todas las vistas del stack
            .navigationDestination(for: Movie.self) {
                movie in
                FavoriteListView()
            }
            .navigationTitle("Movies")
            .searchable(text: Binding.constant(""), placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
        }
    }
}

#Preview {
    MovieListView()
}
