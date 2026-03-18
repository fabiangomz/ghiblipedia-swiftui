//
//  MovieDetailsViewModel.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 14/3/26.
//

import Foundation
import SwiftData

@Observable
class MovieDetailsViewModel {

    var people: [Person] = []
    var isLoading = false
    var errorMessage: String?

    func fetchPeople(from urls: [String], modelContext: ModelContext) async {

        var ids: [String] = []
        for urlString in urls {
            if let url = URL(string: urlString) {
                ids.append(url.lastPathComponent)
            }
        }
        
        let allPeople = (try? modelContext.fetch(FetchDescriptor<Person>())) ?? []
        let cached = allPeople.filter { ids.contains($0.id) }
        
        if cached.count == ids.count, !cached.isEmpty {
            people = cached
            return
        }
        
        isLoading = true
        errorMessage = nil

        do {
            let responses = try await URLSessionManager.shared.getPeople(from: urls)
            
            for response in responses {
                modelContext.insert(Person(from: response))
            }
            try modelContext.save()
            
            let allSaved = (try? modelContext.fetch(FetchDescriptor<Person>())) ?? []
            people = allSaved.filter { ids.contains($0.id) }
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
