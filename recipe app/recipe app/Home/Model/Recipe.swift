//
//  Recipe.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import Foundation

struct Recipes: Codable {
    let recipeList: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case recipeList = "results"
    }
}

struct Recipe: Codable {
    let id: Int
    let name: String
    let dificulty: String
    let duration: Double
    let originContry: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "recipe_name"
        case dificulty = "recipe_dificulty"
        case duration = "recipe_duration"
        case originContry = "recipe_country"
        case image = "recipe_image"
    }
}
