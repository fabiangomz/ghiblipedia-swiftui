//
//  Movie.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

struct Movie: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let originalTitle: String
    let originalTitleRomanised: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    let score: String
    let duration: String
    let image: String
    let movieBanner: String
    let people: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, director, producer, image, people
        case originalTitle = "original_title"
        case originalTitleRomanised = "original_title_romanised"
        case releaseDate = "release_date"
        case score = "rt_score"
        case duration = "running_time"
        case movieBanner = "movie_banner"
    }
}
