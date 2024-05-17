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

// swiftdata model of recipes to be stored
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
    var dateTimeAdded: Date
    
    // init for manually creating a recipe
    init(id: Int?, title: String, description: String? = nil, imageUrl: String?, imageData: Data?, cookingTime: Int, ingredients: [Ingredient]?, steps: [Step]?) {
        self.id = UUID()
        self.apiId = id
        self.title = title
        self.desc = description
        self.imgUrl = imageUrl
        self.userImportedImage = imageData
        self.cookingTime = cookingTime;
        self.ingredients = ingredients
        self.steps = steps
        self.dateTimeAdded = .now
    }
    
    // custom init to allow recipe to conform to decodable protocal and allows json responses from the api to be made into recipe objects
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.apiId = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.imgUrl = try container.decodeIfPresent(String.self, forKey: .image) ?? nil
        self.ingredients = try container.decodeIfPresent([Ingredient].self, forKey: .extendedIngredients)
        self.steps = try container.decodeIfPresent([Step].self, forKey: .analyzedInstructions)
        self.dateTimeAdded = .now
    }
    
    // decoding keys which match the json response from the api
    enum CodingKeys: CodingKey {
        case id, title, image, extendedIngredients, analyzedInstructions
      }
}
