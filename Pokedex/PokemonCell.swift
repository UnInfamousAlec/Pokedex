//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Nathan Falcone on 6/6/18.
//  Copyright © 2018 Falcone Development. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var entryNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokemonImageView.image = nil
    }
}
