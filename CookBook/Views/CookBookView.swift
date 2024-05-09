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
            }.listRowSpacing(10)
        }.navigationTitle("CookBook")
    }
}

#Preview {
    CookBookView()
}
