//
//  HomeView.swift
//  CookBook
//
//  Created by Alex Fogg on 29/4/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    @StateObject var homeViewModel = HomeViewModel()
    //    @State var recipesFromSearch: [Recipe]
    
    var body: some View {
        NavigationStack{
            
            SearchView(homeViewModel: homeViewModel)
                .fixedSize()
            if(homeViewModel.searchIsActive) {
                RecipeSearchResults(homeViewModel: homeViewModel, searchedRecipes: [])
            } else {
                HomeContentView(homeViewModel: homeViewModel)
            }
        }
        .navigationTitle("Home")
    }
}



#Preview {
    HomeView()
}
