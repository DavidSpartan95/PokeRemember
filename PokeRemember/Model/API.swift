//
//  API.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-09.
//

import UIKit
import Foundation

struct Type {
    let slot: Int
    let name: String
}
struct Stat {
    let base_stat: Int
    let effort: Int
    let name: String
}
struct Ability {
    let name: String
    let is_hidden: Bool
    let slot: Int
}

struct Pokemon {
    let abilities : [Ability]
    let forms: [[String: String]]
    let species: [String: String]
    let base_experience: Int
    let sprites: [String: Any]
    let id: Int
    let height: Int
    let stats: [Stat]
    let weight: Int
    let types: [Type]  // Add types field
    
    init?(json: [String: Any]) {
        guard let forms = json["forms"] as? [[String: String]],
              let abilitiesArray = json["abilities"] as? [[String: Any]],
              let species = json["species"] as? [String: String],
              let base_experience = json["base_experience"] as? Int,
              let sprites = json["sprites"] as? [String: Any],
              let id = json["id"] as? Int,
              let height = json["height"] as? Int,
              let weight = json["weight"] as? Int,
              let statsArray = json["stats"] as? [[String: Any]],
              let typesArray = json["types"] as? [[String: Any]] else {
            return nil
        }
        
        var abilities: [Ability] = []
        for abilitiesDict in abilitiesArray {
            guard let is_hidden = abilitiesDict["is_hidden"] as? Bool,
                  let slot = abilitiesDict["slot"] as? Int,
                  let abilityName = abilitiesDict["ability"] as? [String:String],
                  let name = abilityName["name"] else {
                return nil
            }
            let ability = Ability(name: name, is_hidden: is_hidden, slot: slot)
            abilities.append(ability)
                  
        }
        
        var stats: [Stat] = []
        for statDict in statsArray {
            guard let base_stat = statDict["base_stat"] as? Int,
                  let effort = statDict["effort"] as? Int,
                  let statName = statDict["stat"] as? [String: String],
                  let name = statName["name"] else {
                return nil
            }
            
            let stat = Stat(base_stat: base_stat, effort: effort, name: name)
            stats.append(stat)
        }
        
        var types: [Type] = []
        for typeDict in typesArray {
            guard let slot = typeDict["slot"] as? Int,
                  let typeName = typeDict["type"] as? [String: String],
                  let name = typeName["name"] else {
                return nil
            }
            
            let type = Type(slot: slot, name: name)
            types.append(type)
        }
        self.abilities = abilities
        self.forms = forms
        self.species = species
        self.base_experience = base_experience
        self.sprites = sprites
        self.id = id
        self.height = height
        self.weight = weight
        self.stats = stats
        self.types = types
    }
}

func decodeAPI(pokemonID:Int, onCompletion: @escaping(Result<Pokemon, Error>) -> Void ) -> Pokemon? {
    
    var pokemon: Pokemon?
    let urlLink = "https://pokeapi.co/api/v2/pokemon/" + "\(pokemonID)"
    guard let url = URL(string: urlLink) else { return nil }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        let decoder = JSONDecoder()

        if let data = data {
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let pokemon = Pokemon(json: jsonObject) {

                        onCompletion(.success(pokemon))
                        // ...
                    }
                }
            } catch {
                onCompletion(.failure(error))
                print("JSON parsing error: \(error)")
            }
        }
    }
    task.resume()
    return pokemon
}

//Thread.sleep(forTimeInterval: 3.0)
//for x in pokemonArray {print(x.id)}


