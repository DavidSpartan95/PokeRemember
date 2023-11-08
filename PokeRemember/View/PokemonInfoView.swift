//
//  PokemonInfoPage.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-09.
//

import Foundation
import SwiftUI

struct PokemonInfoView: View {
    
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
                    
                    DataWindow(text:"Base EXP \(String(pokemonInfo.base_experience))")
                    
                    HStack {
                        DataWindow(text: " Height \(String(pokemonInfo.height/10))m")
                        DataWindow(text: "Weight \(String(pokemonInfo.weight/10))kg")
                    }
                    
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
