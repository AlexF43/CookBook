//
//  JokeModel.swift
//  CookBook
//
//  Created by Alex Fogg on 9/5/2024.
//

import Foundation

/// api response for the trivia api
final class TriviaResponse: Decodable{
    var trivia: String
    
    // conform to decodable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.trivia = try container.decode(String.self, forKey: .text)
    }
    
    // keys to match field name in the api
    enum CodingKeys: CodingKey {
        case text
      }
}
