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
    let ingredientsModel = IngredientsModel()
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        VStack{
            HStack {
                TextField("Ingredient", text: $ingredient)
                    .textFieldStyle(.roundedBorder)

                TextField("Amount", text: $amount)
                    .textFieldStyle(.roundedBorder)

                Picker("Select a unit", selection: $unit) {
                    ForEach(Array(ingredientsModel.units.keys), id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)

                Button {
                    let unitModel = UnitModel(amount: Double(amount) ?? 0, unit: unit)
                    let descName = ingredientsModel.getDescName(amount: Double(amount) ?? 0, unit: unit, name: ingredient)
                    let newIngredient = Ingredient(name: ingredient, descName: descName, amount: unitModel)
                    recipeViewModel.ingredients.append(newIngredient)
                    ingredient = ""
                    amount = ""
                } label: {
                    Text("Add")
                        .bold()
                }.buttonStyle(.borderedProminent)
                
            }.tint(.rose)
            List {
                ForEach(recipeViewModel.ingredients.indices, id: \.self) { index in
                    HStack{
                        Text("\(recipeViewModel.ingredients[index].descName ?? "")")
                        Spacer()
                        Button {
                            recipeViewModel.ingredients.remove(at: index)
                        } label: {
                            Text("X")
                                .foregroundColor(.gray)
                                .bold()
                        }
                    }
                }
            }
        }
    
    }
        
        
}
 
    
    
    //#Preview {
    //    AddIngredientView()
    //}

