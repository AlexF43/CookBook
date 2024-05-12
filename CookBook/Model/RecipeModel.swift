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

final class RecipeApiResponse: Decodable {
    var results: [Recipe];
    var offset: Int;
    var number: Int;
    var totalResults: Int;
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
    
    init(id: Int?, title: String, description: String , userImportedImage: Data?, cookingTime: Int, ingredients: [Ingredient], steps: [Step]) {
        self.id = UUID()
        self.apiId = id
        self.title = title
        self.desc = description
        self.imgUrl = imgUrl
        self.userImportedImage = userImportedImage
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
        self.ingredients = try container.decode([Ingredient].self, forKey: .extendedIngredients)
        self.steps = try container.decode([Step].self, forKey: .analyzedInstructions)
    }
    
    enum CodingKeys: CodingKey {
        case id, title, image, extendedIngredients, analyzedInstructions
      }
    
}
