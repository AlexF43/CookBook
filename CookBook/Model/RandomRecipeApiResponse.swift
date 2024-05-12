//
//  RandomRecipeApiResponse.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import Foundation

final class RandomRecipeApiResponse: Decodable {
    var recipes: [recipeDetailApiResponse];
}
