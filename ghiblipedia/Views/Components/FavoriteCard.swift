//
//  FavoriteCard.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 15/3/26.
//

import SwiftUI
import Kingfisher

struct FavoriteCard: View {
    let image: String
    
    var body: some View {
        KFImage(URL(string: image))
            .placeholder {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .aspectRatio(2/3, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
    }
}

#Preview {
    FavoriteCard(image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/qG3RYlIVpTYclR9TYIsy8p7m7AT.jpg")
}
