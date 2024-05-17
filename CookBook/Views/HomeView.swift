//
//  HomeView.swift
//  CookBook
//
//  Created by Alex Fogg on 29/4/2024.
//

import SwiftUI

/// parent home view
struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack{
        
            // always display the search bar at the top of the home view
            SearchView(homeViewModel: homeViewModel)
                .fixedSize()
            // if the search bar is currently active then show search results, if it is not active then show home content
            if(homeViewModel.searchIsActive) {
                RecipeSearchResults(homeViewModel: homeViewModel, searchedRecipes: [])
            } else {
                HomeContentView()
            }
        }
        .navigationTitle("Home")
       
    }
}
