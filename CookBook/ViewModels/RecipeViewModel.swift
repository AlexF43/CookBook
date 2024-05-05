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
    
    func createRecipe() -> Recipe {
        let newRecipe = Recipe(id: nil, title: title, description: description, imgUrl: "https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Spinach-Tomato-Pasta-bowl-500x500.jpg", cookingTime: Int(cookingTime) ?? 0, ingredients: ingredients, steps: steps)
        return newRecipe
    }

}
