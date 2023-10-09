//
//  PokemonData.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-09.
//

import Foundation

struct PokemonEntry:Identifiable {
    var id = UUID()
    var name: String
    var urlPicture: String
    var dexNo: Int
}

let pokeArray = [
    PokemonEntry(name: "Golduck", urlPicture: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/55.png", dexNo:55),
    PokemonEntry(name: "Pikachu", urlPicture: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/25.png", dexNo:25),
    PokemonEntry(name: "Bulbasaur", urlPicture: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png", dexNo:1)
]
