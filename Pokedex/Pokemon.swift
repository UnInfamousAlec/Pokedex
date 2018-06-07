//
//  Pokemon.swift
//  Pokedex
//
//  Created by Nathan Falcone on 6/6/18.
//  Copyright © 2018 Falcone Development. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    
    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case name = "name"
    }
    
    let entryNumber: Int
    let name: String
    
    var imageUrlString: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(entryNumber).png"
    }
}

