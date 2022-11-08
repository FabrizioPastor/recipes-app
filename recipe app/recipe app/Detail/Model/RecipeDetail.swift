//
//  RecipeDetail.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import Foundation

//Estoy repitiendo pero es porque no tengo un backend y necesito filtrar por id :'v
struct RecipesDetail: Codable {
    let recipeList: [RecipeDetail]
    
    enum CodingKeys: String, CodingKey {
        case recipeList = "results"
    }
}

struct RecipeDetail: Codable {
    let name: String
    let dificulty: String
    let duration: Double
    let originContry: String
    let image: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "recipe_name"
        case dificulty = "recipe_dificulty"
        case duration = "recipe_duration"
        case originContry = "recipe_country"
        case image = "recipe_image"
        case description = "recipe_description"
    }
}
