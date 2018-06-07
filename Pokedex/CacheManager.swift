//
//  CacheManager.swift
//  Pokedex
//
//  Created by Nathan Falcone on 6/6/18.
//  Copyright © 2018 Falcone Development. All rights reserved.
//

import UIKit

class CacheManager {
    
    static let shared = CacheManager()
    
    var cache = NSCache<NSString, UIImage>()
    
    func image(for pokemon: Pokemon) -> UIImage? {
        let image = cache.object(forKey: pokemon.cacheKey)
        return image
    }
    
    func cache(_ image: UIImage, for pokemon: Pokemon) {
        cache.setObject(image, forKey: pokemon.cacheKey)
    }
}
