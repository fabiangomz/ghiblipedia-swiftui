//
//  Movie.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import Foundation
import SwiftData

@Model
class Movie: Hashable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    @Attribute(.unique) var id: String
    var title: String
    var originalTitle: String
    var originalTitleRomanised: String
    var movieDescription: String
    var director: String
    var producer: String
    var releaseDate: String
    var score: String
    var duration: String
    var image: String
    var movieBanner: String
    var people: [String]
    var isFavorite: Bool
    
    init(from response: MovieResponse) {
        self.id = response.id
        self.title = response.title
        self.originalTitle = response.originalTitle
        self.originalTitleRomanised = response.originalTitleRomanised
        self.movieDescription = response.description
        self.director = response.director
        self.producer = response.producer
        self.releaseDate = response.releaseDate
        self.score = response.score
        self.duration = response.duration
        self.image = response.image
        self.movieBanner = response.movieBanner
        self.people = response.people
        self.isFavorite = false
    }
}
