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
                .font(.system(size: 36).bold())
                .foregroundColor(colorScheme == .dark ? textColor : .white)
                .accessibilityIdentifier("Title")
            
            ActionButton(title: "Sign Out") {
                logout()
                logedIn = false
            }
            .accessibilityIdentifier("SignOutButton")
            
            NavigationLink(destination: SelectDeckView(), label: {
                NavigationButton(title: "Play")
            })
            .accessibilityIdentifier("PlayButton") // Add an identifier for the Play button
            
            NavigationLink(destination: PokemonListPage(), label: {
                NavigationButton(title: "Pokedex")
            })
            .accessibilityIdentifier("PokedexButton") // Add an identifier for the Pokedex button
            
            NavigationLink(destination: ScheduleMakerView(), label: {
                NavigationButton(title: "Plan Your Study")
            })
            .accessibilityIdentifier("PlanYourStudyButton") // Add an identifier for the Plan Your Study button
            
            Spacer() // Add Spacer to push content to the top
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) // Make the VStack fill the whole screen
            .background(primaryColor)
    }
}


