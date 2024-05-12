//
//  StepModel.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import Foundation

struct Step: Codable, Identifiable, Hashable {
    static func == (lhs: Step, rhs: Step) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    var id: UUID = UUID()
    var number: Int
    var name: String
    var ingredients: [Ingredient]?
    
    init(number: Int, name: String, ingredients: [Ingredient]? = nil) {
        self.number = number
        self.name = name
        self.ingredients = ingredients
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Int.self, forKey: .number)
        self.name = try container.decode(String.self, forKey: .step)
        self.ingredients = try container.decodeIfPresent([Ingredient].self, forKey: .ingredients)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(number, forKey: .number)
        try container.encode(name, forKey: .step)
        try container.encodeIfPresent(ingredients, forKey: .ingredients)
    }
    
    enum CodingKeys: CodingKey {
        case number, step, ingredients
    }
}

final class StepApiResponse: Codable {
    var name: String
    var steps: [Step]
}
