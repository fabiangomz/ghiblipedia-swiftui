//
//  People.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 14/3/26.
//

import Foundation
import SwiftData

@Model
class Person {
    @Attribute(.unique) var id: String
    var name: String
    var gender: String
    var age: String
    var eyeColor: String
    var hairColor: String
    var films: [String]
    
    init(from response: PeopleResponse) {
        self.id = response.id
        self.name = response.name
        self.gender = response.gender
        self.age = response.age
        self.eyeColor = response.eyeColor
        self.hairColor = response.hairColor
        self.films = response.films
    }
}
