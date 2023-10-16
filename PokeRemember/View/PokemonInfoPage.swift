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
    @State var pokemonInfo: Pokemon? = nil
    
    func getPokemon() {
        pokemonInfo = decodeAPI(pokemonID: POKEMON.dexNo, onCompletion: {result in
            
            switch result {
            case .success(let retrievedPokemon):
                self.pokemonInfo = retrievedPokemon
            case .failure(let error):
                self.pokemonInfo = nil
                print("Error: \(error)")
            }
            
        })
    }

    var body: some View {
        VStack {
            if let pokemonInfo = pokemonInfo {
                
                Text(String(pokemonInfo.height))
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
                
            }else{
                ProgressView()
            }
        }.onAppear(perform: {
            self.getPokemon()
        })
    }
}
