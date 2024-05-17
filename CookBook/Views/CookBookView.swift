//
//  CookBookView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

//the whole cookbook view, using recipe row views for each recipe stored in the cookbook
struct CookBookView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    var body: some View {
        NavigationStack {
            VStack{
                if (recipes.isEmpty){
                    Text("No saved Recipes")
                } else {
                    List {
                        ForEach(recipes) { recipe in
                            NavigationLink {
                                RecipeDetailView(recipe: recipe)
                            } label: {
                                RecipeRowView(recipe: recipe)
                            }
                        }.onDelete(perform: { indexSet in
                            for index in indexSet {
                                modelContext.delete(recipes[index])
                            }
                        })
                    }.listRowSpacing(0)
                }
            }.navigationTitle("CookBook")
        }
    }
}

#Preview {
    CookBookView()
}
