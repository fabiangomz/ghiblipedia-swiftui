//
//  MovieResponse.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 18/3/26.
//

struct MovieResponse: Codable {
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
