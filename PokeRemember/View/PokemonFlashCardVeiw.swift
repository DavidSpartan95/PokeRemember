//
//  PokemonFlashCardVeiw.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-19.
//

import Foundation
import SwiftUI

struct PokemonFlashCardView: View {
    var randomNumber = Int.random(in: 0 ..< pokeArray.count)
    
    func shuffleNewPokemon(dexNo: Int) -> [String] {
        return ["Pika", "Pika", "Pika", "Pika"]
    }
    
    @State private var score = 0
    @State private var choice: [String]
    
    init() {
        //self.randomNumber = randomNumber
        self._choice = State(initialValue: [
            pokeArray[randomNumber].name,
            pokeArray[Int.random(in: 0 ..< pokeArray.count)].name,
            pokeArray[Int.random(in: 0 ..< pokeArray.count)].name,
            pokeArray[Int.random(in: 0 ..< pokeArray.count)].name
        ])
    }
    
    var body: some View {
        
        VStack{
            Text("SCORE: \(score)")
            AsyncImage(url: URL(string:pokeArray[randomNumber].urlPicture)){ phase in
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
                Button(choice[0], action: {
                    if choice[0] == pokeArray[randomNumber].name {
                        score += 1
                    }
                    
                })
                Button(choice[1], action: {
                    if choice[1] == pokeArray[randomNumber-1].name {
                        score += 1
                    }
                })
            }
            HStack{
                Button(choice[2], action: {
                    if choice[2] == pokeArray[randomNumber-1].name {
                        score += 1
                    }
                })
                Button(choice[3], action: {
                    if choice[3] == pokeArray[randomNumber-1].name {
                        score += 1
                    }
                })
            }
        }
        
        
    }
    
}
