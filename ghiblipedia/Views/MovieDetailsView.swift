//
//  MovieDetailsView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 14/3/26.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: movie.movieBanner)) {
                image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            .clipped()
            
            HStack {
                AsyncImage(url: URL(string: movie.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title)
                        .font(.title2)
                        .bold()
                    Text(movie.description)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Text(movie.originalTitleRomanised)
                        .font(.subheadline)
                        .foregroundStyle(.tertiary)
                    Text(movie.releaseDate)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
            
                      
            
        }
    }
}

#Preview {
    
    let movie = Movie(id: "1", title: "Title", originalTitle: "Original title", originalTitleRomanised: "Original title romanji", description: "Desc", director: "Director", producer: "Producer", releaseDate: "Release Date", score: "3", duration: "120", image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg", movieBanner: "https://image.tmdb.org/t/p/original/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg", people: [])
    
    MovieDetailsView(movie: movie)
}
