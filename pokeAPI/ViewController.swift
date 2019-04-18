//
//  ViewController.swift
//  pokeAPI
//
//  Created by MCS on 4/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

struct Character: Decodable {
    
    let name: String
    let id: Int
    
}


class ViewController: UIViewController {
    @IBOutlet weak var view: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPokemonJSON { (res) in
            switch res {
            case .success(let characters):
                .characters.forEach ({ (character) in
                    print(character.name)
                })
            case .failure(let err):
                print("Failure to fetch charcter", err)
                
            }
        }
        
    }
    fileprivate func fetchPokemonJSON(completion: @escaping(Result<[Character], err>) -> ()) {
        
        
        let urlString = "PokemonExample.json"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) {
            (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                completion(nil, err)
                return
            }
            do {
                let characters = try JSONDecoder().decode([Character].self, from: data!)
                completion(.success(characters))
                completion(characters, nil)
                
            } catch let jsonError{
                completion(.failure(jsonError))
                completion(nil, jsonError)
            }
            
            
            }.resume()
        
        
    }
    
    @IBOutlet weak var action: UITableView!
}


