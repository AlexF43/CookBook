//
//  UnitModel.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import Foundation

struct UnitModel: Codable {
    var amount: Double
    var unit: String
    
    init(amount: Double, unit: String){
        self.amount = amount
        self.unit = unit
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.unit = try container.decode(String.self, forKey: .unitShort)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
        try container.encode(unit, forKey: .unitShort)
    }
    
    enum CodingKeys: CodingKey {
        case amount, unitShort
    }
    
    
}
