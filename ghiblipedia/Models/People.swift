//
//  People.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 14/3/26.
//

nonisolated struct People: Codable, Identifiable, Sendable {
    let id: String
    let name: String
    let gender: String
    let age: String
    let eyeColor: String
    let hairColor: String
    let films: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, gender, age, films
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
}
