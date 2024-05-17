//
//  RandomRecipeApiResponse.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import Foundation

/// api response model for random recipes
final class RandomRecipeApiResponse: Decodable {
    var recipes: [recipeDetailApiResponse];
}
