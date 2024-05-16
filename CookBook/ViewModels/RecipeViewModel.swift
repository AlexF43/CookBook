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
    @Published var steps: [Step] = []
    @Published var imageData: Data?
    @Published var saved: Bool = false
    
    func createRecipe() -> Recipe {
        let newRecipe = Recipe(id: nil, title: title, description: description, imageData: imageData, cookingTime: Int(cookingTime) ?? 0, ingredients: ingredients, steps: steps)
        return newRecipe
    }
    
    func updateStepNumbers(){
        for i in 0..<steps.count {
            steps[i].number = i + 1
        }
    }

}
