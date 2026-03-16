//
//  Appearance.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 16/3/26.
//

// https://medium.com/@nayananp/swiftui-toggle-between-dark-light-system-across-whole-app-e29c7d9d25b3
enum Appearance: String, CaseIterable, Identifiable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"
    
    var id: String { self.rawValue }
}
