//
//  SelectDeckView.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-11-01.
//

import SwiftUI

struct SelectDeckView: View {
    @State private var isShowingGame = false
    
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
            NavigationLink(destination: PokemonFlashCardView(deck: kantoDeck, isShowing: $isShowingGame), label: {
                NavigationButton(title:"Kanto")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: jhotoDeck, isShowing: $isShowingGame), label: {
                NavigationButton(title:"Jhoto")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: hoennDeck, isShowing: $isShowingGame), label: {
                NavigationButton(title:"Hoenn")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: sinnohDeck, isShowing: $isShowingGame), label: {
                NavigationButton(title:"Sinnoh")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: unovaDeck, isShowing: $isShowingGame), label: {
                NavigationButton(title:"Unova")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: alolaDeck, isShowing: $isShowingGame), label: {
                NavigationButton(title:"Alola")
            })
            NavigationLink(destination: PokemonFlashCardView(deck: galarDeck, isShowing: $isShowingGame), label: {
                NavigationButton(title:"Galar")
            })
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center ) // Make the VStack fill the whole screen
            .background(primaryColor)
    }
    
}

