//
//  CookBookView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

struct CookBookView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    var body: some View {
        VStack{
            Button("recipes"){
                modelContext.insert(Recipe(id: 1, title: "Creamy Spinach Tomato Pasta", description: "Yummy", imgUrl: "https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Spinach-Tomato-Pasta-bowl-500x500.jpg", ingredients: [Ingredient(name: "Pasta", amount: 2, unit: "grams", descName: "2 grams of Pasta")], steps: ["1. Cook Pasta", "2. Eat Pasta"]))
            }
            List {
                ForEach(recipes) { recipe in
                NavigationLink {
                    RecipeDetailView()
                } label: {
                    RecipeRowView(recipe: recipe)
                }
            }.onDelete(perform: { indexSet in
                    for index in indexSet {
                        modelContext.delete(recipes[index])
                    }
                })
            }.listRowSpacing(10)
        }
    }
}

#Preview {
    CookBookView()
}
