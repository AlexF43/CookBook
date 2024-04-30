//
//  AddRecipeView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

struct AddRecipeView: View {
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    //to insert a new recipe into the database:
    //make a new recipe object using smth like newRecipe = Recipe(ingredients ect)
    //insert into database using "modelContext.insert(newRecipe)"
}

#Preview {
    AddRecipeView()
}
