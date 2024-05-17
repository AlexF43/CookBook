//
//  UnitModel.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import Foundation

/// model for a amount and its respective unit
struct UnitModel: Codable, Hashable {
    var amount: Double
    var unit: String
    
    init(amount: Double, unit: String){
        self.amount = amount
        self.unit = unit
    }
    
    // conform to decodable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.unit = try container.decode(String.self, forKey: .unitShort)
    }
    
    // conform to encodable
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
        try container.encode(unit, forKey: .unitShort)
    }
    
    // keys to match the field names in the api json response
    enum CodingKeys: CodingKey {
        case amount, unitShort
    }
    
    
}
