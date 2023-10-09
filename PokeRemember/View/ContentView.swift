//
//  ContentView.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("PokeRemember").font(.system(size: 36).bold()).foregroundColor(.white)
                    PokemonList()
            }
            .padding().background(.red)
        }
    }
}

struct PokemonList: View {
    var body: some View {
        ZStack {
            List() {
                ForEach(pokeArray) { pokemon in
                    NavigationLink( destination: PokemonInfoPage(POKEMON: pokemon)){
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
                            Text(pokemon.name)
                        }
                    }
                }
            }.background(.red).scrollContentBackground(.hidden).cornerRadius(8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
