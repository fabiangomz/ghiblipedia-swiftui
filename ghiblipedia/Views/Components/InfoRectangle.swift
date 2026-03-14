//
//  InfoRectangle.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 14/3/26.
//

import SwiftUI

struct InfoRectangle: View {
    
    let label: String
    let info: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.tint)
            
            VStack(alignment: .leading) {
                Text(label)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(info)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            Spacer()
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
}

#Preview {
    
    InfoRectangle(label: "Score", info: "93%", icon: "star.fill")
}
