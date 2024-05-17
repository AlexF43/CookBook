//
//  RecipeDetailApiResponse.swift
//  CookBook
//
//  Created by Alex Fogg on 17/5/2024.
//

import Foundation

/// model api response for getting recipe detail
final class recipeDetailApiResponse: Codable {
    var id : Int
    var title: String
    var image: String
    var readyInMinutes: Int
    var extendedIngredients: [Ingredient]
    var analyzedInstructions: [StepApiResponse]
}
