//
//  PokemonInfoPage.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-09.
//

import Foundation
import SwiftUI

struct PokemonInfoPage: View {
    
    let POKEMON: PokemonEntry
    
    var body: some View {
        VStack {
            Text(POKEMON.name)
            AsyncImage(url: URL(string:POKEMON.urlPicture)){ phase in
                if let image = phase.image{
                    image.resizable().frame(width: 100, height: 100)
                } else if phase.error != nil {
                    // Handle error
                    Text("Error loading image")
                } else {
                    // Placeholder or loading view
                    ProgressView()
                }
            }
        }
    }
}
