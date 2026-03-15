//
//  MovieDetailsViewModel.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 14/3/26.
//

import Foundation

@Observable
class MovieDetailsViewModel {

    var people: [People] = []
    var isLoading = false
    var errorMessage: String?

    func fetchPeople(from urls: [String]) async {
        isLoading = true
        errorMessage = nil

        do {
            people = try await URLSessionManager.shared.getPeople(from: urls)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
