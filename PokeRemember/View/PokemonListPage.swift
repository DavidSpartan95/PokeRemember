//
//  PokemonListPage.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-16.
//

import SwiftUI

struct PokemonListPage: View {
    @EnvironmentObject var dataManager: DataManager
    @Binding var logedIn: Bool
    
    var body: some View {
        VStack {
            Button("logout", action: {
                logout()
                logedIn = false
                
            })
            Button("Change Age", action: {
                if let userUID = dataManager.userUID {
                    dataManager.updateAge(age: 567, userUID: userUID)
                }else{
                    print("NO userUID")
                }
            })
            Text(dataManager.user?.name ?? "NO DATA")
            
            Text("PokeRemember").font(.system(size: 36).bold()).foregroundColor(.white)
                PokemonList()
        }
        .padding().background(.red)
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
