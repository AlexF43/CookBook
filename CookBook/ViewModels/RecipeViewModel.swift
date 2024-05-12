//
//  RecipeViewModel.swift
//  CookBook
//
//  Created by Rhianna McCormack on 5/5/2024.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var cookingTime: String = ""
    @Published var ingredients: [Ingredient] = []
    @Published var steps: [String] = []
    @Published var imageData: Data?
    
    func createRecipe() -> Recipe {
        let newRecipe = Recipe(id: nil, title: title, description: description, imageUrl: "", imageData: imageData, cookingTime: Int(cookingTime) ?? 0, ingredients: ingredients, steps: nil, stepStrings: steps)
        return newRecipe
    }

}
