//
//  RecipeSearchResults.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import SwiftUI

/// view displays the results of the search in searchview
struct RecipeSearchResults: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    /// the results of the current search
    @State var searchedRecipes: [Recipe]
    
    var body: some View {
        
        // list displaying each of the recipe results which navigates to the respective recipes detail view when clicked
        List {
            ForEach(searchedRecipes) { recipe in
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    RecipeRowView(recipe: recipe)
                }
            }
        }
        // when the search text has not been edited in 0.3 seconds and is not blank then get the new search results
        .onReceive(homeViewModel.$searchText.debounce(for: .seconds(0.3), scheduler: DispatchQueue.main), perform: { _ in
            if homeViewModel.searchText != "" {
                // function to make api request to get recipes based on the search term
                RecipeSearchService().getRecipes(searchTerm: homeViewModel.searchText) { recipes in
                    searchedRecipes = recipes
                }
            }
        })
    }
}
