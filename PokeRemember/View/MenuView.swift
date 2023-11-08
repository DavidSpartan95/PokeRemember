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
            
            Text("PokeRemember")
                .font(.system(size: 40).bold())
                .foregroundColor(colorScheme == .dark ? textColor : .white)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                .accessibilityIdentifier("Title")
            
            Spacer()
            
            VStack{
                
                NavigationLink(destination: SelectDeckView(), label: {
                    NavigationButton(title: "Play")
                })
                .accessibilityIdentifier("PlayButton")
                
                NavigationLink(destination: PokemonListPage(), label: {
                    NavigationButton(title: "Pokedex")
                })
                .accessibilityIdentifier("PokedexButton")
                
                NavigationLink(destination: ScheduleMakerView(), label: {
                    NavigationButton(title: "Make Routine")
                })
                .accessibilityIdentifier("PlanYourStudyButton")
                
                ActionButton(title: "Sign Out") {
                    logout()
                    logedIn = false
                }
                .accessibilityIdentifier("SignOutButton")
                
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            Spacer()
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) // Make the VStack fill the whole screen
            .background(primaryColor)
    }
}


