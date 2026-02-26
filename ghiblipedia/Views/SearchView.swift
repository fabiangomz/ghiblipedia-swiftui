//
//  SearchView.swift
//  ghiblipedia
//
//  Created by Fabián Gómez Campo on 26/2/26.
//

import SwiftUI

struct SearchView: View {

    @State private var text: String = ""

    var body: some View {
        NavigationStack {
            VStack {

                Text("Search")
                    .foregroundStyle(.secondary)

            }
            .navigationTitle("Search")
            .searchable(text: $text)

        }
    }
}

#Preview {
    SearchView()
}
