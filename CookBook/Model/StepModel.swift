//
//  StepModel.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import Foundation

struct Step: Codable {
    
    var number: Int
    var name: String
    var ingredients: [Ingredient]
    
    init(number: Int, name: String, ingredients: [Ingredient]) {
        self.number = number
        self.name = name
        self.ingredients = ingredients
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Int.self, forKey: .number)
        self.name = try container.decode(String.self, forKey: .step)
        self.ingredients = try container.decode([Ingredient].self, forKey: .ingredients)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(number, forKey: .number)
        try container.encode(name, forKey: .step)
        try container.encode(ingredients, forKey: .ingredients)
    }
    
    enum CodingKeys: CodingKey {
        case number, step, ingredients
    }
}
