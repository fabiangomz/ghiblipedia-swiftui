//
//  PeopleResponse.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 18/3/26.
//

struct PeopleResponse: Codable, Sendable {
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
