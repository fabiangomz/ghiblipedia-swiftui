//
//  FavoriteListView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI

struct FavoriteListView: View {
    let movies: [Movie]
    @Environment(FavoriteViewModel.self) private var favoriteViewModel
    @Namespace private var namespace
    
    var body: some View {
        let favoriteMovies = movies.filter { favoriteViewModel.isFavorite($0) }
        
        NavigationStack {
            Group {
                if favoriteMovies.isEmpty {
                    ContentUnavailableView("No Favorites", systemImage: "heart.slash", description: Text("Movies you favorite will appear here."))
                } else {
                    ScrollView {
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 200))], spacing: 16) {
                            ForEach(favoriteMovies) { movie in
                                NavigationLink(value: movie) {
                                    FavoriteCard(image: movie.image)
                                        .matchedTransitionSource(id: movie.id, in: namespace)
                                }
                                .buttonStyle(.plain)
                                .contextMenu {
                                    Button(role: .destructive) {
                                        favoriteViewModel.toggleFavorite(movie)
                                    } label: {
                                        Label("Remove from Favorites", systemImage: "heart.slash")
                                    }
                                } preview: {
                                    MovieDetailsView(movie: movie)
                                        .environment(favoriteViewModel)
                                        .frame(width: 400, height: 600)
                                }
                            }
                        }
                        .padding()
                        
                    }
                    
                    
                }
            }
            .navigationTitle("Favorites")
            .navigationDestination(for: Movie.self) {
                movie in
                MovieDetailsView(movie: movie).navigationTransition(.zoom(sourceID: movie.id, in: namespace))
            }
        }
    }
}

#Preview {
    let movie = Movie(
        id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
        title: "Castle in the Sky",
        originalTitle: "天空の城ラピュタ",
        originalTitleRomanised: "Tenkū no shiro Rapyuta",
        description: "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa.",
        director: "Hayao Miyazaki",
        producer: "Isao Takahata",
        releaseDate: "1986",
        score: "95",
        duration: "124",
        image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
        movieBanner: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
        people: [
            "https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9",
            "https://ghibliapi.vercel.app/people/fe93adf2-2f3a-4ec4-9f68-5422f1b87c01"
        ]
    )

    FavoriteListView(movies: [movie])
        .environment(FavoriteViewModel())
}
