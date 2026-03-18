//
//  MovieListView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI
import SwiftData

struct MovieListView: View {

    @Bindable var viewModel: MovieListViewModel
    @Environment(FavoriteViewModel.self) private var favoriteViewModel
    @Environment(\.modelContext) private var modelContext
    @State private var selectedMovie: Movie?

    var body: some View {
        NavigationStack {
            List(viewModel.filteredMovies) { movie in
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
                        
                        if favoriteViewModel.isFavorite(movie) {
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                        }
                        
                    }
                    .padding(.vertical)
                   
                }
                .contextMenu {
                    Button(role: favoriteViewModel.isFavorite(movie) ? .destructive : nil) {
                        favoriteViewModel.toggleFavorite(movie)
                    } label: {
                        Label(favoriteViewModel.isFavorite(movie) ? "Remove from Favorites" : "Add to Favorites",
                              systemImage: favoriteViewModel.isFavorite(movie) ? "heart.slash" : "heart")
                    }
                } preview: {
                    MovieDetailsView(movie: movie)
                        .environment(favoriteViewModel)
                        .frame(width: 400, height: 600)
                
                }
                .swipeActions(edge: .trailing) {
                    Button {
                        favoriteViewModel.toggleFavorite(movie)
                    } label: {
                        Image(systemName: favoriteViewModel.isFavorite(movie) ? "heart.slash" : "heart")
                    }
                    .tint(favoriteViewModel.isFavorite(movie) ? .red : .blue)
                }
                
            }.task {
                await viewModel.fetchMovies(modelContext: modelContext)
                
            }
            // Importante usar navigation destination porque si no se cargan todas las vistas del stack
            .navigationDestination(for: Movie.self) {
                movie in
                MovieDetailsView(movie: movie)
            }
            .navigationTitle("Movies")
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search movies")
        }
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel())
        .environment(FavoriteViewModel())
        .modelContainer(for: [Movie.self, Person.self], inMemory: true)
}
