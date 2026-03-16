//
//  FavoriteCard.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 15/3/26.
//

import SwiftUI

struct FavoriteCard: View {
    let image: String
    
    // forzar llamada
    @State private var uuid = UUID()
    
    var body: some View {
        AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
          
        } placeholder: {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
        }
        .id(uuid)
        .frame(height: 260)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
        .onAppear {
            uuid = UUID()
        }
    }
}

#Preview {
    FavoriteCard(image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/qG3RYlIVpTYclR9TYIsy8p7m7AT.jpg")
}
