//
//  RecipeModel.swift
//  CookBook
//
//  Created by Alex Fogg on 29/4/2024.
//

import Foundation
import SwiftData
import UIKit
import SwiftUI

final class RecipeListApiResponse: Decodable {
    var results: [Recipe];
    var offset: Int;
    var number: Int;
    var totalResults: Int;
}

final class recipeDetailApiResponse: Codable {
    var id : Int
    var title: String
    var image: String
    var readyInMinutes: Int
    var extendedIngredients: [Ingredient]
    var analyzedInstructions: [StepApiResponse]
}


@Model
final class Recipe: Decodable {
    var id: UUID
    var apiId: Int?
    var title: String
    var desc: String?
    var imgUrl: String?
    @Attribute(.externalStorage) var userImportedImage: Data?
    var cookingTime: Int?
    var ingredients: [Ingredient]?
    var steps: [Step]?
    
    init(id: Int?, title: String, description: String? = nil, imageUrl: String, cookingTime: Int, ingredients: [Ingredient], steps: [Step]) {
        self.id = UUID()
        self.apiId = id
        self.title = title
        self.desc = description
        self.imgUrl = imageUrl
        self.cookingTime = cookingTime;
        self.ingredients = ingredients
        self.steps = steps
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.apiId = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.imgUrl = try container.decode(String.self, forKey: .image)
        self.ingredients = try container.decodeIfPresent([Ingredient].self, forKey: .extendedIngredients)
        self.steps = try container.decodeIfPresent([Step].self, forKey: .analyzedInstructions)
    }
    
    enum CodingKeys: CodingKey {
        case id, title, image, extendedIngredients, analyzedInstructions
      }
    
}
