//
//  IngredientModel.swift
//  CookBook
//
//  Created by Alex Fogg on 29/4/2024.
//

import Foundation
import SwiftData
import SwiftUI

/// model for ingredient to be used in the recipe and step models
struct Ingredient: Codable, Identifiable, Hashable {
    
    // function which allow ingredients to be compared
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: UUID
    var name: String
    var image: String?
    var descName: String?
    var amount: UnitModel?
    
    init(name: String, descName: String, amount: UnitModel) {
        self.id = UUID()
        self.name = name
        self.descName = descName
        self.amount = amount
    }
    
    // both the encodeable and decodable inits allow ingredient to conform to codable
    // conform to decodable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? nil
        self.descName = try container.decodeIfPresent(String.self, forKey: .originalName)
        self.amount = try container.decodeIfPresent(UnitModel.self, forKey: .metric)
    }
    
    // conform to encodable
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(descName, forKey: .originalName)
        try container.encodeIfPresent(amount, forKey: .metric)
    }
    
    // keys to match the ingredient api responses
    enum CodingKeys: CodingKey {
        case name, image, originalName, metric
    }
}
