//
//  RecipeSearchResults.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import SwiftUI

struct RecipeSearchResults: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State var searchedRecipes: [Recipe]
    @State var selectedRecipe: Recipe? = nil
    @State var isLoading: Bool = false
    var body: some View {
        List {
            ForEach(searchedRecipes) { recipe in
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    RecipeRowView(recipe: recipe)
                }
            }
        }
        .onReceive(homeViewModel.$searchText.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main), perform: { _ in
            if homeViewModel.searchText != "" {
                RecipeSearchService().getRecipes(searchTerm: homeViewModel.searchText) { recipes in
                    searchedRecipes = recipes
                }
            }
        })
    }
}

#Preview {
    RecipeSearchResults(homeViewModel: HomeViewModel(), searchedRecipes: [])
}
