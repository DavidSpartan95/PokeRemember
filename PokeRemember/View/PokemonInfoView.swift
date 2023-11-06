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
                
                AsyncImage(url: URL(string:POKEMON.urlPicture)){ phase in
                    if let image = phase.image{
                        image.resizable()
                            .frame(width: 200, height: 200)
                            .shadow(radius: 5)
                    } else if phase.error != nil {
                        // Handle error
                        Text("Error loading image")
                    } else {
                        // Placeholder or loading view
                        ProgressView()
                    }
                    
                    HStack {
                        ForEach(pokemonInfo.types) { type in
                            TypeEmblem(type: type.name)
                        }
                    }
                    
                    Text(" Height \(String(pokemonInfo.height/10))m")
                    Text(" weight \(String(pokemonInfo.weight/10))kg")
                    Text(" Base EXP \(String(pokemonInfo.base_experience))")
                    Spacer()
                }
                
            }else{
                ProgressView()
            }
            
        }.onAppear(perform: {
            self.getPokemon()
        }).frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center ) // Make the VStack fill the whole screen
            .background(primaryColor)
    }
}
