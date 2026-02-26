//
//  Movie.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

struct Movie: Codable {
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    let releaseYear: String
    let score: String
    let duration: String
    let image: String
    let bannerImage: String
    let people: [String]
}
