//
//  JokeModel.swift
//  CookBook
//
//  Created by Alex Fogg on 9/5/2024.
//

import Foundation

final class TriviaResponse: Decodable{
    var trivia: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.trivia = try container.decode(String.self, forKey: .text)
    }
    
    enum CodingKeys: CodingKey {
        case text
      }
}
