//
//  ViewController.swift
//  pokeAPI
//
//  Created by MCS on 4/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var jsonData: PokeVars?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Poke")
        
        let url = Bundle.main.url(forResource: "PokemonExample", withExtension: "json")
        
        print(url)
        
        let data = try? Data(contentsOf: url!)
        
        print(data)
        
        jsonData = try? JSONDecoder().decode(PokeVars.self, from: data!)
        
        print(jsonData)
        
        tableView.reloadData()
        
//        fetchPokemonJSON { (res) in
//            switch res {
//            case .success(let characters):
//                characters.forEach ({ (character) in
//                    print(character)
//                })
//            case .failure(let err):
//                print("Failure to fetch charcter", err)
//
//            }
//        }
        
    }
    fileprivate func fetchPokemonJSON(completion: @escaping(Result<[Character], Error>) -> ()) {
        
        let url = Bundle.main.url(forResource: "PokemonExample", withExtension: "json")
        
        let data = try? Data(contentsOf: url!)
        
        jsonData = try? JSONDecoder().decode(PokeVars.self, from: data!)
        
        
//        let urlString = "PokemonExample.json"
//        guard let url = URL(string: urlString) else {return}
//        URLSession.shared.dataTask(with: url) {
//            (data, resp, err) in
//
//            if let err = err {
//                completion(.failure(err))
////                completion(nil, err)
//                return
//            }
//            do {
//                let characters = try JSONDecoder().decode([Character].self, from: data!)
//                completion(.success(characters))
////                completion(characters, nil)
//
//            } catch let jsonError{
//                completion(.failure(jsonError))
////                completion(nil, jsonError)
//            }
//
//
//            }.resume()
    }
    
}
extension ViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (jsonData == nil) ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Poke")
        
        cell.textLabel?.text = jsonData?.name
        
        return cell
    }
    
    
}
