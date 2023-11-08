//
//  PokemonListPage.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-16.
//

import SwiftUI

struct PokemonListView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        
        VStack {
            Text(dataManager.user?.name ?? "No name")
            PokemonList()
        }
        .padding().background(primaryColor)
    }
}

struct PokemonList: View {
    var body: some View {
        ZStack {
            List() {
                ForEach(pokeArray) { pokemon in
                    NavigationLink( destination: PokemonInfoView(POKEMON: pokemon)){
                        HStack{
                            AsyncImage(url: URL(string:pokemon.urlPicture)){ phase in
                                if let image = phase.image{
                                    image.resizable().frame(width: 25, height: 25)
                                } else if phase.error != nil {
                                    // Handle error
                                    Text("Error loading image")
                                } else {
                                    // Placeholder or loading view
                                    ProgressView()
                                }
                            }
                            Text(pokemon.name).foregroundColor(textColor)
                        }
                    }
                }
            }.background(primaryColor).scrollContentBackground(.hidden).cornerRadius(8)
        }
    }
}
