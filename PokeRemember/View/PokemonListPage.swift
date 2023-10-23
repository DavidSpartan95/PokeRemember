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
    @State private var isActive: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width * 0.3
            let height = geometry.size.height * 0.05
            VStack {
                ActionButton(title:"LogOut",width: width, height: height){
                    logout()
                    logedIn = false
                }
                NavigationLink("", destination: PokemonFlashCardView(), isActive: $isActive).hidden() // Hidden NavigationLink
                
                ActionButton(title:"Play",width: width, height: height){
                    isActive = true
                }
                Text(dataManager.user?.name ?? "NO DATA")
                
                Text("PokeRemember").font(.system(size: 36).bold()).foregroundColor(.white)
                    PokemonList()
            }
            .padding().background(primaryColor)
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
