//
//  SelectDeckView.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-11-01.
//

import SwiftUI

struct SelectDeckView: View {
    
    let allDecks = [
        kantoDeck,
        jhotoDeck,
        hoennDeck,
        sinnohDeck,
        unovaDeck,
        kalosDeck,
        alolaDeck,
        galarDeck
    ]
    
    var body: some View {
        
        VStack{
            NavigationLink(destination: PokemonFlashCardView(deck: kantoDeck), label: {
                NavigationButton(title:"Kanto")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: jhotoDeck), label: {
                NavigationButton(title:"Jhoto")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: hoennDeck), label: {
                NavigationButton(title:"Hoenn")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: sinnohDeck), label: {
                NavigationButton(title:"Sinnoh")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: unovaDeck), label: {
                NavigationButton(title:"Unova")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: alolaDeck), label: {
                NavigationButton(title:"Alola")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: galarDeck), label: {
                NavigationButton(title:"Galar")
            })
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center ) // Make the VStack fill the whole screen
            .background(primaryColor)
    }
    
}

