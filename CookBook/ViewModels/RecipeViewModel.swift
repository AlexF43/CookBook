//
//  RecipeViewModel.swift
//  CookBook
//
//  Created by Rhianna McCormack on 5/5/2024.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var title: String = ""
      @Published var description: String = ""
      @Published var ingredients: [Ingredient] = []
      @Published var steps: [String] = []
    
    

}
