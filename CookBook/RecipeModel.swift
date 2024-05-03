//
//  RecipeModel.swift
//  CookBook
//
//  Created by Alex Fogg on 29/4/2024.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    var id: Int
    var title: String
    var desc: String
    var imgUrl: String
    var cookingTime: Int
    var ingredients: [Ingredient]
    var steps: [String]
    
    init(id: Int, title: String, description: String ,imgUrl: String, cookingTime: Int, ingredients: [Ingredient], steps: [String]) {
        self.id = id
        self.title = title
        self.desc = description
        self.imgUrl = imgUrl
        self.cookingTime = cookingTime;
        self.ingredients = ingredients
        self.steps = steps
    }
}
