//
//  Pokemon.swift
//  Pokedex
//
//  Created by Nathan Falcone on 6/6/18.
//  Copyright © 2018 Falcone Development. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case species = "pokemon_species"
    }
    
    let entryNumber: Int
    let species: Species
    
    struct Species: Decodable {
        let name: String
        
//        enum CodingKeys: String, CodingKey {
//            case name = "name"
//        }
    }
    
    var name: String {
        return species.name
    }
    
    var imageUrlString: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(entryNumber).png"
    }
}

struct PokedexResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case pokemon = "pokemon_entries"
    }
    
    let pokemon: [Pokemon]
}
