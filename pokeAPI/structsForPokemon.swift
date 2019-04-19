//
//  structsForPokemon.swift
//  pokeAPI
//
//  Created by MCS on 4/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct PokeVars: Decodable {
    var abilities: [Ability]
    var base_experience: Int
    var name: String
    var id: Int
    var height: Int
    var order: Int
    var weight: Int
    var is_default: Bool
    var location_area_encounters: String
    var moves: [Moves]
    var forms: [Forms]
    var species: [Species]
    var sprites: [Sprites]
    var stats: [Stats]
    var types: [Types]
}

struct Ability: Decodable {
    var name: String
    var url: String
    
}

struct Moves: Decodable {
    var move: String
    var version_group_details: String
}

struct Forms: Decodable {
    var name: String
    var url: String
}

struct Species: Decodable {
    var name: String
    var url: String
}

struct Sprites: Decodable {
    var back_default: String
    var back_female: String?
    var back_shiny: String
    var back_shiny_female: String?
    var front_default: String
    var front_female: String?
    var front_shiny: String
    var front_shiny_female: String?
}

struct Stats: Decodable {
    var base_stat: Int
    var effort: Int
    var stat: String
}

struct Types: Decodable {
    var slot: Int
    var type: String
}
