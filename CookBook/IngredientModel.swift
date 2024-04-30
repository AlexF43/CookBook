//
//  IngredientModel.swift
//  CookBook
//
//  Created by Alex Fogg on 29/4/2024.
//

import Foundation
import SwiftData

struct Ingredient: Codable {
    
    
    var name: String
    var amount: Double
    var unit: String
    var descName: String
    
    init(name: String, amount: Double, unit: String, descName: String) {
        self.name = name
        self.amount = amount
        self.unit = unit
        self.descName = descName
    }
}
