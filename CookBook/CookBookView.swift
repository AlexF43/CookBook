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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("yay")
        Button("recipes"){
            modelContext.insert(Recipe(id: 1, title: "Pasta", description: "Yummy", imgUrl: "https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Spinach-Tomato-Pasta-bowl-500x500.jpg", ingredients: [Ingredient(name: "Pasta", amount: 2, unit: "grams", descName: "2 grams of Pasta")], steps: ["1. Cook Pasta", "2. Eat Pasta"]))
        }
        List{
            ForEach(recipes) { recipe in
                Text(recipe.title)
            }
        }
    }
}

#Preview {
    CookBookView()
}
