//
//  PokemonController.swift
//  Pokedex
//
//  Created by Nathan Falcone on 6/6/18.
//  Copyright © 2018 Falcone Development. All rights reserved.
//

import Foundation

class PokemonController {
    
    static func fetchKantoPokedex(callback: @escaping (_ pokemon: [Pokemon], _ errorMessage: String?) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokedex/2/") else {
            callback([], "Failed to create pokedex URL.")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let urlResponse = response as? HTTPURLResponse else {
                callback([], "Unknown error occurred. Please check your network connection.")
                return
            }
            guard error == nil else {
                callback([], "Failed to fetch pokedex with status code: \(urlResponse.statusCode).")
                return
            }
            guard let data = data else {
                callback([], "Failed to retreive data. Status code: \(urlResponse.statusCode).")
                return
            }
            do {
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode([Pokemon].self, from: data)
                callback(pokemon, nil)
            } catch {
                callback([], "Failed to decode data into Pokemon.")
            }
        }
    }
}
