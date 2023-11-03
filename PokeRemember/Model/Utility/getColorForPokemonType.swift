//
//  getColorForPokemonType.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-11-01.
//

import SwiftUI

func getColorForPokemonType(typeName: String) -> Color {
    
    switch typeName {
        
    case "normal": return Color(red: 167/255, green: 168/255, blue: 121/255)
    case "fighting": return Color(red: 190/255, green: 50/255, blue: 45/255)
    case "flying": return Color(red: 168/255, green: 144/255, blue: 240/255)
    case "poison": return Color(red: 167/255, green: 63/255, blue: 160/255)
    case "ground": return Color(red: 222/255, green: 193/255, blue: 104/255)
    case "rock": return Color(red: 183/255, green: 160/255, blue: 57/255)
    case "bug": return Color(red: 168/255, green: 185/255, blue: 32/255)
    case "ghost": return Color(red: 112/255, green: 88/255, blue: 151/255)
    case "steel": return Color(red: 184/255, green: 185/255, blue: 121/255)
    case "fire": return Color(red: 239/255, green: 128/255, blue: 50/255)
    case "water": return Color(red: 103/255, green: 144/255, blue: 240/255)
    case "grass": return Color(red: 122/255, green: 200/255, blue: 79/255)
    case "electric": return Color(red: 246/255, green: 210/255, blue: 48/255)
    case "psychic": return Color(red: 245/255, green: 168/255, blue: 133/255)
    case "ice": return Color(red: 152/255, green: 216/255, blue: 219/255)
    case "dragon": return Color(red: 112/255, green: 56/255, blue: 248/255)
    case "dark": return Color(red: 112/255, green: 88/255, blue: 71/255)
    case "fairy": return Color(red: 237/255, green: 153/255, blue: 172/255)
    default: return Color(red: 102/255, green: 161/255, blue: 144/255)
    }
}

