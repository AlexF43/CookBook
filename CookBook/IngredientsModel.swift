//
//  IngredientsModel.swift
//  CookBook
//
//  Created by Rhianna McCormack on 4/5/2024.
//

import Foundation
struct IngredientsModel {
    let ingredients = [Ingredient]()
    let units = ["g": "gram", "kg": "kilogram", "mL": "millilitre", "L": "litre", "item": ""]
    
    func getAmount(amount: Double) -> String {
        if amount.truncatingRemainder(dividingBy: 1) == 0{
            print("integer value")
            return String(Int(amount))
        } else {
            return String(amount)
        }
    }
    
    func getDescName(amount: Double, unit: String, name: String) -> String {
    var newAmount = 0
        var amountString: String = getAmount(amount: amount)
        if amount > 1 {
            return ("\(amountString) \(unit)s of \(name)")
        } else {
            return ("\(amountString) \(unit) of \(name)")
        }
    }
    
}
