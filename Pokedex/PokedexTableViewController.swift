//
//  PokedexTableViewController.swift
//  Pokedex
//
//  Created by Nathan Falcone on 6/6/18.
//  Copyright © 2018 Falcone Development. All rights reserved.
//

import UIKit

class PokedexTableViewController: UITableViewController {
    
    var pokemon: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPokedex()
    }
    
    func fetchPokedex() {
        PokemonController.fetchKantoPokedex { (pokemon, errorMessage) in
            DispatchQueue.main.async {
                if let errorMessage = errorMessage {
                    self.showErrorAlert(errorMessage)
                } else {
                    self.pokemon = pokemon
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func showErrorAlert(_ errorMessage: String) {
        let alert = UIAlertController(title: "Error Occurred :(", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        
        let pokemon = self.pokemon[indexPath.row]
        cell.nameLabel?.text = pokemon.name.uppercased()
        cell.entryNumberLabel?.text = "#\(pokemon.entryNumber)"
        cell.tag = indexPath.row
        
        PokemonController.fetchImage(for: pokemon) { (image) in
            DispatchQueue.main.async {
                if indexPath.row == cell.tag {
                    cell.pokemonImageView?.image = image
                }
            }
        }
        
        return cell
    }
}
