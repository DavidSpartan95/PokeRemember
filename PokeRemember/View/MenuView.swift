//
//  MenuView.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-27.
//

import SwiftUI

struct MenuView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dataManager: DataManager
    @Binding var logedIn: Bool
    
    var body: some View{

        VStack{
            Text("PokeRemember").font(.system(size: 36).bold()).foregroundColor(colorScheme == .dark ? textColor : .white)
            
            ActionButton(title:"Sign Out"){
                logout()
                logedIn = false
            }
            NavigationLink(destination: SelectDeckView(), label: {
                NavigationButton(title:"Play")
            })
            
            NavigationLink(destination: PokemonListPage(), label: {
                NavigationButton(title:"Pokedex")
            })
            
            NavigationButton(title:"Plan Your Study")
            Spacer() // Add Spacer to push content to the top
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center ) // Make the VStack fill the whole screen
            .background(primaryColor)
    }
}

