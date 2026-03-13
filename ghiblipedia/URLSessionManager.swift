//
//  URLSessionManager.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import Foundation

class URLSessionManager {
    static let shared = URLSessionManager()
    
    private let baseURL = "https://ghibliapi.vercel.app"
    private let session: URLSession
    
    var dataTask: URLSessionDataTask?
    
    private init() {
        let sessionConfiguration = URLSessionConfiguration.default
        session = URLSession(configuration: sessionConfiguration)
    }
    
    
    func getMovies() async throws -> [Movie] {
       /* guard let url = URL(string: "\(baseURL)/films") else {
            throw URLError(.badURL)
        } */
        
        let (data, response) = try await session.data(from: Constants.Urls.moviesUrl)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        
        return try decoder.decode([Movie].self, from: data)
    }
}
