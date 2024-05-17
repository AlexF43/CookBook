//
//  RecipeListApiResponse.swift
//  CookBook
//
//  Created by Alex Fogg on 17/5/2024.
//

import Foundation

// model of recipe search api response
final class RecipeListApiResponse: Decodable {
    var results: [Recipe];
    var offset: Int;
    var number: Int;
    var totalResults: Int;
}
