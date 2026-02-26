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
    
    func getMovies() async throws -> Void {
        guard let url = URL(string: "\(baseURL)/films") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await session.data(from: url)
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200,
           let string = String(data: data, encoding: .utf8) {
               print(string)
        }
    }
}
