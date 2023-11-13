//
//  getDeckName.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-11-03.
//

import Foundation

func getDeckName(deckName: [PokemonEntry]) -> String {
    switch deckName {
    case kantoDeck:
        return "kanto_score"
    case jhotoDeck:
        return "jhoto_score"
    case hoennDeck:
        return "hoenn_score"
    case sinnohDeck:
        return "sinnoh_score"
    case unovaDeck:
        return "unova_score"
    case kalosDeck:
        return "kalos_score"
    case alolaDeck:
        return "alola_score"
    case galarDeck:
        return "galar_score"
    default:
        return ""
    }
}


func getDeckHighScore(user:UserData,deckName: [PokemonEntry]) -> Int {

    switch deckName {
    case kantoDeck:
        return user.kanto_score
    case jhotoDeck:
        return user.johto_score
    case hoennDeck:
        return user.hoenn_score
    case sinnohDeck:
        return user.sinnoh_score
    case unovaDeck:
        return user.unova_score
    case kalosDeck:
        return user.kalos_score
    case alolaDeck:
        return user.alola_score
    case galarDeck:
        return user.galar_score
    default:
        return 0
    }
}

