//
//  AddIngredientViewModel.swift
//  CookBook
//
//  Created by Alex Fogg on 17/5/2024.
//

import Foundation

/// view model for add ingredient view, contains Ingredients model of ingredients and their units
class AddIngredientViewModel: ObservableObject {
    @Published var ingredient: String = ""
    @Published var amount: String = ""
    @Published var unit: String = ""
    
    /// model for ingredients and their related units
    struct IngredientsModel {
        let ingredients = [Ingredient]()
        let units = ["g": "gram", "kg": "kilogram", "mL": "millilitre", "L": "litre", "item": ""]
        
        /// returns the string value for the amount
        func getAmount(amount: Double) -> String {
            if amount.truncatingRemainder(dividingBy: 1) == 0{
                print("integer value")
                return String(Int(amount))
            } else {
                return String(amount)
            }
        }
        
        /// returns the plain english wording of the specific quantity and unit
        func getDescName(amount: Double, unit: String, name: String) -> String {
            let amountString: String = getAmount(amount: amount)
            if amount > 1 {
                return ("\(amountString) \(unit)s of \(name)")
            } else {
                return ("\(amountString) \(unit) of \(name)")
            }
        }
        
    }
}
