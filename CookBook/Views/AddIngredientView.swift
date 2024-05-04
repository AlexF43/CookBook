//
//  AddIngredientView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 3/5/2024.
//

import SwiftUI

struct AddIngredientView: View {
    @State private var ingredient: String = ""
    @State var ingredients: [Ingredient]
    @State private var unit: String = ""
    let units = ["g", "kg", "mL", "L"]
    var body: some View {
        TextField("Ingredient", text: $ingredient)
        Picker("Select a unit", selection: $unit) {
            ForEach(units, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.menu)
        
//        List(ingredients) { ingredient in
////            ForEach(ingredients) { ingredient in
//                Text(ingredient.name)
//            }
        }
    }


//#Preview {
//    AddIngredientView()
//}
