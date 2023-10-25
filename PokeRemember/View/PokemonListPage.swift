//
//  PokemonListPage.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-16.
//

import SwiftUI

struct PokemonListPage: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dataManager: DataManager
    @Binding var logedIn: Bool
    @State private var isActive: Bool = false
    
    var body: some View {
        
        VStack {
            Text("PokeRemember").font(.system(size: 36).bold()).foregroundColor(colorScheme == .dark ? textColor : .white)
            
            ActionButton(title:"Sign Out"){
                logout()
                logedIn = false
            }
            //This navigation method sucks
            NavigationLink("", destination: PokemonFlashCardView(), isActive: $isActive).hidden() // Hidden NavigationLink
            
            ActionButton(title:"Play"){
                isActive = true
            }
            //Text(dataManager.user?.name ?? "NO DATA")
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
                            Text(pokemon.name).foregroundColor(textColor)
                        }
                    }
                }
            }.background(primaryColor).scrollContentBackground(.hidden).cornerRadius(8)
        }
    }
}
