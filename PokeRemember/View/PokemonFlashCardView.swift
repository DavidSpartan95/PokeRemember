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
    @Binding var isShowing: Bool
    
    init(deck: [PokemonEntry], isShowing: Binding<Bool>) {
        self.deck = deck
        self._game = StateObject(wrappedValue: FlashCardGame(deckToStudy: deck))
        self._isShowing = isShowing
    }
    
    var body: some View {
        
        VStack{
            
            DataWindow(text: "CARDS LEFT: \(game.cardsLeft)", color:nil)
            HStack{
                if let user = dataManager.user {
                    DataWindow(text: "PB: \(String(getDeckHighScore(user: user, deckName: deck)))", color: nil)
                }
                DataWindow(text: "SCORE: \(game.score)",color:nil)
            }
            
            Spacer()
            
            if game.gameOver {
                let _ = newBestScore()
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .shadow(radius: 5)
                    .foregroundColor(highlightColor)
                
                Spacer()
                
                HStack{
                    ActionButton(title: "Try Again"){
                        game.resetGame()
                    }
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }else {
                AsyncImage(url: URL(string:game.deck[game.randomNumber].urlPicture)){ phase in
                    if let image = phase.image{
                        
                        image.resizable()
                            .frame(width: 200, height: 200)
                            .shadow(color: Color.black, radius: 5)
                        
                    } else if phase.error != nil {
                        // Handle error
                        Text("Error loading image")
                    } else {
                        // Placeholder or loading view
                        ProgressView()
                    }
                }
                
                Spacer()
                
                HStack{
                    ActionButton(title: game.choices[0]){
                        game.checkAwnser(awsner: game.choices[0])
                    }
                    
                    ActionButton(title: game.choices[1]){
                        game.checkAwnser(awsner: game.choices[1])
                    }
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    ActionButton(title: game.choices[2]){
                        game.checkAwnser(awsner: game.choices[2])
                    }
                    ActionButton(title: game.choices[3]){
                        game.checkAwnser(awsner: game.choices[3])
                    }
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }

        }.frame(maxWidth: .infinity, maxHeight: .infinity) // Make the VStack fill the whole screen
            .background(primaryColor) // Set the background color of the VStack to red
    }
    func newBestScore(){
        if let userUID = dataManager.userUID {
            if let user = dataManager.user {
                
                let currentBestScore = getDeckHighScore(user: user, deckName: deck)
                
                if currentBestScore < game.score {
                    dataManager.updateScore(deckName: getDeckName(deckName: deck), score: game.score, userUID: userUID )
                }
            }
        }
    }
}
