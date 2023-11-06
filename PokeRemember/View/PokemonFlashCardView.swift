//
//  PokemonFlashCardVeiw.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-19.
//

import Foundation
import SwiftUI

struct PokemonFlashCardView: View {
    
    var deck: [PokemonEntry]
    @EnvironmentObject var dataManager: DataManager
    @StateObject var game: FlashCardGame
    
    init(deck: [PokemonEntry]) {
            self.deck = deck
            self._game = StateObject(wrappedValue: FlashCardGame(deckToStudy: deck))
        }
    
    var body: some View {
        
        VStack{
            if let user = dataManager.user {
                Text(String(getDeckHighScore(user: user, deckName: deck))).bold().foregroundColor(.white)
            }
            
            Text("CARDS LEFT: \(game.cardsLeft)").bold().foregroundColor(.white)
            Text("SCORE: \(game.score)").bold().foregroundColor(.white)
            if game.gameOver {
                let _ = newBestScore()
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .shadow(radius: 5)
            }else {
                AsyncImage(url: URL(string:game.deck[game.randomNumber].urlPicture)){ phase in
                    if let image = phase.image{
                        
                        image.resizable()
                            .frame(width: 200, height: 200)
                            .shadow(color: Color.black, radius: 5) // Add a shadow with a blue color and radius of 5
                        
                    } else if phase.error != nil {
                        // Handle error
                        Text("Error loading image")
                    } else {
                        // Placeholder or loading view
                        ProgressView()
                    }
                }
                HStack{
                    ActionButton(title: game.choices[0]){
                        game.checkAwnser(awsner: game.choices[0])
                    }
                    
                    ActionButton(title: game.choices[1]){
                        game.checkAwnser(awsner: game.choices[1])
                    }
                }
                HStack{
                    ActionButton(title: game.choices[2]){
                        game.checkAwnser(awsner: game.choices[2])
                    }
                    ActionButton(title: game.choices[3]){
                        game.checkAwnser(awsner: game.choices[3])
                    }
                }
            }

        }.frame(maxWidth: .infinity, maxHeight: .infinity) // Make the VStack fill the whole screen
            .background(primaryColor) // Set the background color of the VStack to red
    }
    func newBestScore(){
        print("Activate")
        if let userUID = dataManager.userUID {
            dataManager.updateScore(deckName: getDeckName(deckName: deck), score: game.score, userUID: userUID )
        }
    }
}