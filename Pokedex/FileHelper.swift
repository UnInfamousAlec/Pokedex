//
//  FileHelper.swift
//  Pokedex
//
//  Created by Nathan Falcone on 6/6/18.
//  Copyright © 2018 Falcone Development. All rights reserved.
//

import UIKit

class FileHelper {
    
    static let fileManager = FileManager.default
    
    static var pokedexDirectory: URL {
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let pokedexDirectory = documentsDirectory.appendingPathComponent("Pokedex", isDirectory: true)
        if fileManager.fileExists(atPath: pokedexDirectory.path) == false {
            do {
                try fileManager.createDirectory(at: pokedexDirectory, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Failed to create Pokedex file path.")
            }
        }
        return pokedexDirectory
    }
    
    static func fileUrl(for pokemon: Pokemon) -> URL {
        let imageName = "\(pokemon.entryNumber)\(pokemon.name).png"
        let fileUrl = pokedexDirectory.appendingPathComponent(imageName)
        return fileUrl
    }
    
    static func store(_ image: UIImage, for pokemon: Pokemon) {
        let fileUrl = self.fileUrl(for: pokemon)
        
        guard fileManager.fileExists(atPath: fileUrl.path) == false else {
            print("Failed to store image for #\(pokemon.entryNumber) \(pokemon.name). File exists at: \(fileUrl.path).")
            return
        }
        guard let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            print("Failed to store image for #\(pokemon.entryNumber) \(pokemon.name). Could not convert image to Data.")
            return
        }
        do {
            try imageData.write(to: fileUrl)
        } catch {
            print("Failed to write image to file path: \(fileUrl.path).")
        }
    }
    
    static func retrieve(imageFor pokemon: Pokemon) -> UIImage? {
        let fileUrl = self.fileUrl(for: pokemon)
        
        guard let data = fileManager.contents(atPath: fileUrl.path),
            let image = UIImage(data: data) else {
                return nil
        }
        return image
    }
    
    static func deletePokedexDirectory() {
        do {
            try fileManager.removeItem(at: pokedexDirectory)
        } catch {
            print("Failed to delete pokedex directory. Error: \(error)")
        }
    }
}
