//
//  RecipeViewModel.swift
//  CookBook
//
//  Created by Rhianna McCormack on 5/5/2024.
//

import Foundation
import SwiftUI

// view model containing the recipe being created in the add recipe and related views
class RecipeViewModel: ObservableObject {
    
    // all the fields to be filled out in the creation of a new recipe
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var cookingTime: String = ""
    @Published var ingredients: [Ingredient] = []
    @Published var steps: [Step] = []
    @Published var imageData: Data?
    @Published var saved: Bool = false
    
    // creates a recipe object from the fields in the view model
    func createRecipe() -> Recipe {
        let newRecipe = Recipe(id: nil, title: title, description: description, imageUrl: nil, imageData: imageData, cookingTime: Int(cookingTime) ?? 0, ingredients: ingredients, steps: steps)
        return newRecipe
    }
    
    // updates the step numbers int the step object
    func updateStepNumbers() {
        for i in 0..<steps.count {
            steps[i].number = i + 1
        }
    }

}
