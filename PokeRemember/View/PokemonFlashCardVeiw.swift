//
//  PokemonFlashCardVeiw.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-19.
//

import Foundation
import SwiftUI

struct PokemonFlashCardView: View {
    
    
    @StateObject var game = FlashCardGame(deckToStudy: kalosDeck)
    
    var body: some View {
        
        VStack{
            Text("CARDS LEFT: \(game.cardsLeft)")
            Text("SCORE: \(game.score)")
            if game.deck.isEmpty {
                Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.green)
            }else {
                AsyncImage(url: URL(string:game.deck[game.randomNumber].urlPicture)){ phase in
                    if let image = phase.image{
                        image.resizable().frame(width: 200, height: 200)
                    } else if phase.error != nil {
                        // Handle error
                        Text("Error loading image")
                    } else {
                        // Placeholder or loading view
                        ProgressView()
                    }
                }
                HStack{
                    Button(game.choices[0], action: {
                        game.checkAwnser(awsner: game.choices[0])
                        
                    })
                    Button(game.choices[1], action: {
                        game.checkAwnser(awsner: game.choices[1])
                    })
                }
                HStack{
                    Button(game.choices[2], action: {
                        game.checkAwnser(awsner: game.choices[2])
                    })
                    Button(game.choices[3], action: {
                        game.checkAwnser(awsner: game.choices[3])
                    })
                }
            }
        }
    }
    
}
