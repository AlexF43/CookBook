//
//  AddIngredientView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 3/5/2024.
//

import SwiftUI

struct AddIngredientView: View {
    @State private var ingredient: String = ""
    @State private var amount: String = ""
    @State private var unit: String = ""

    @State var ingredients: [Ingredient]
    let ingredientsModel = IngredientsModel()
    var body: some View {
        VStack{
            HStack {
                TextField("Ingredient", text: $ingredient)
                TextField("Amount", text: $amount)
                Picker("Select a unit", selection: $unit) {
                    ForEach(Array(ingredientsModel.units.keys), id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                Button("Add Ingredient"){
                    let descName = ingredientsModel.getDescName(amount: Double(amount) ?? 0, unit: unit, name: ingredient)
                    let newIngredient = Ingredient(name: ingredient, amount: Double(amount) ?? 0, unit: unit, descName: descName)
                    ingredients.append(newIngredient)
                }
            }
            List(ingredients) { ingredient in
                ForEach(ingredients) { ingredient in
                    Text(ingredient.descName)
                }
            }
        }
        
        
    }
 
    
    
    //#Preview {
    //    AddIngredientView()
    //}
}
