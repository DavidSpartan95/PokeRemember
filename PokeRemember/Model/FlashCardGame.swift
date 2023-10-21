//
//  FlashCardGame.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-20.
//

import Foundation

class FlashCardGame: ObservableObject{
    @Published var cardsLeft: Int
    @Published var deck: [PokemonEntry]
    var randomNumber = Int.random(in: 0 ..< pokeArray.count)
    @Published var score = 0
    @Published var choices: [String]
    
    init() {
        //self.randomNumber = randomNumber
        self.deck = pokeArray
        self.choices =  [
            pokeArray[randomNumber].name,
            pokeArray[Int.random(in: 0 ..< pokeArray.count)].name,
            pokeArray[Int.random(in: 0 ..< pokeArray.count)].name,
            pokeArray[Int.random(in: 0 ..< pokeArray.count)].name
        ]
        self.cardsLeft = pokeArray.count
        choices.shuffle()
    }
    
    func checkAwnser(awsner:String){
        if awsner == deck[randomNumber].name {
            addPoints()
        }
        shuffleDeck(removeCard: deck[randomNumber].name)
    }
    
    private func addPoints(){
        score += 1
    }
    
    private func shuffleDeck(removeCard: String) {
        
        // Remove the card that was just shown
        deck = deck.filter { $0.name != removeCard }
        if deck.isEmpty {
            cardsLeft = 0
            return
            
        }
        cardsLeft = deck.count
        
        
        if deck.count > 0 {
            randomNumber = Int.random(in: 0 ..< deck.count)
        } else {
            randomNumber = 0
        }
        
        var tempChoices: [String] = []
        //append the correct awnser
        tempChoices.append(deck[randomNumber].name)
        //append 3 radnom names from of all pokemon (all must be unique)
        while tempChoices.count < 4 {
            
            let randomName = pokeArray.randomElement()?.name
            if !tempChoices.contains(where: {$0 == randomName}) {
                tempChoices.append(randomName ?? "???")
            }
        }
        
        choices = tempChoices
        choices.shuffle()
    }
}
