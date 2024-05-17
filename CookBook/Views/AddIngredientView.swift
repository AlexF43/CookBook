//  AddIngredientView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 3/5/2024.
//

import SwiftUI

/// child view to add recipe view to add ingredients to the recipe
struct AddIngredientView: View {
    @StateObject var addIngredientViewModel = AddIngredientViewModel()
    @ObservedObject var recipeViewModel: RecipeViewModel
    let ingredientsModel = AddIngredientViewModel.IngredientsModel()
    
    var body: some View {
        VStack{
            HStack {
                // textfield to enter ingredients
                TextField("Ingredient", text: $addIngredientViewModel.ingredient)
                    .textFieldStyle(.roundedBorder)
                
                // textfield to enter the respective amount of the ingredient
                TextField("Amount", text: $addIngredientViewModel.amount)
                    .textFieldStyle(.roundedBorder)
                
                // picker to select the unit
                Picker("Select a unit", selection: $addIngredientViewModel.unit) {
                    ForEach(Array(ingredientsModel.units.keys), id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                // button to call function to add ingredient to the ingredient list
                Button {
                    addIngredient()
                } label: {
                    Text("Add")
                        .bold()
                }.buttonStyle(.borderedProminent)
                
            }.tint(.rose)
            
            // list of all current ingredients
            List {
                ForEach(recipeViewModel.ingredients.indices, id: \.self) { index in
                    HStack{
                        Text("\(recipeViewModel.ingredients[index].descName ?? "")")
                        Spacer()
                        // button to remove ingredient from list
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
    
    /// generates a unitmodel, descriptive name and finally the ingredient model and adds it to the list of ingredients
    func addIngredient() {
        let unitModel = UnitModel(amount: Double(addIngredientViewModel.amount) ?? 0, unit: addIngredientViewModel.unit)
        let descName = ingredientsModel.getDescName(amount: Double(addIngredientViewModel.amount) ?? 0, unit: addIngredientViewModel.unit, name: addIngredientViewModel.ingredient)
        let newIngredient = Ingredient(name: addIngredientViewModel.ingredient, descName: descName, amount: unitModel)
        recipeViewModel.ingredients.append(newIngredient)
        addIngredientViewModel.ingredient = ""
        addIngredientViewModel.amount = ""
    }
}
