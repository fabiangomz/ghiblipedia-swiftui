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
        ScrollView {
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
                
                HStack(alignment: .bottom) {
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
                        Text(movie.originalTitle)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Text(movie.originalTitleRomanised)
                            .font(.subheadline)
                            .foregroundStyle(.tertiary)
                        Text(movie.releaseDate)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom, 0)
                }
                .padding(.horizontal)
                .padding(.top, -50)
                
                Grid {
                    GridRow {
                        InfoRectangle(label: "Score", info: "\(movie.score)%", icon: "star.fill")
                        InfoRectangle(label: "Duration", info: "\(movie.duration) min", icon: "clock.fill")
                        
                    }
                    GridRow {
                        InfoRectangle(label: "Director", info: movie.director, icon: "megaphone.fill")
                        InfoRectangle(label: "Director", info: movie.director, icon: "person.fill")
                    }
                }.padding()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Synopsis")
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text(movie.description)
                        .font(.body)
                        .foregroundStyle(.secondary)
    
                }
                .padding(.horizontal)
            }
        
            
          
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .foregroundStyle(.primary)
                }
            }
        }
        .ignoresSafeArea()
  
    }
}

#Preview {
    
    let movie = Movie(id: "1", title: "Title", originalTitle: "Original title", originalTitleRomanised: "Original title romanji", description: "Desc", director: "Director", producer: "Producer", releaseDate: "Release Date", score: "3", duration: "120", image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg", movieBanner: "https://image.tmdb.org/t/p/original/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg", people: [])
    
    NavigationStack {
        MovieDetailsView(movie: movie)
    }
}
