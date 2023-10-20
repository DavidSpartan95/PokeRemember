//
//  FlashCardGame.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-20.
//

import Foundation

class FlashCardGame: ObservableObject{
    var deck = pokeArray
    var randomNumber = Int.random(in: 0 ..< pokeArray.count)
    //@Published var correctAwnser: String
    var score = 0
    @Published var choices: [String]
    
    init() {
        //self.randomNumber = randomNumber
        self.choices =  [
            deck[randomNumber].name,
            deck[Int.random(in: 0 ..< deck.count)].name,
            deck[Int.random(in: 0 ..< deck.count)].name,
            deck[Int.random(in: 0 ..< deck.count)].name
        ]
        choices.shuffle()
    }
    
    func checkAwnser(awsner:String){
        
        if awsner == pokeArray[randomNumber].name {
            addPoints()
        }
        shuffleDeck()
    }
    
    private func addPoints(){
        score += 1
    }
    
    private func shuffleDeck(){
        //TODO FILTER OUT THE CARD JUST SHOWN
        randomNumber = Int.random(in: 0 ..< deck.count)
        choices =  [
            deck[randomNumber].name,
            deck[Int.random(in: 0 ..< deck.count)].name,
            deck[Int.random(in: 0 ..< deck.count)].name,
            deck[Int.random(in: 0 ..< deck.count)].name
        ]
        choices.shuffle()
    }
}
