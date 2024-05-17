//
//  CookBookView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

/// cookbook view, showing the users saved recipes
struct CookBookView: View {
    
    // swiftdata database reference and saved recipes from the database
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    var body: some View {
        NavigationStack {
            VStack{
                
                // if there are recipes saved then display them but if not display text explaining the user
                if (recipes.isEmpty){
                    Text("No saved Recipes")
                } else {
                    // list of all saved recipes displayed in their row views
                    List {
                        ForEach(recipes) { recipe in
                            // recipes navigate to their detailview when clicked
                            NavigationLink {
                                RecipeDetailView(recipe: recipe)
                            } label: {
                                RecipeRowView(recipe: recipe)
                            }
                        }
                        // removes a recipe from the database if the user swipes left on it
                        .onDelete(perform: { indexSet in
                            for index in indexSet {
                                modelContext.delete(recipes[index])
                            }
                        })
                    }
                    .listRowSpacing(0)
                }
            }
            .navigationTitle("CookBook")
        }
    }
}
