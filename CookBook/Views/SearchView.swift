//
//  SearchView.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import SwiftUI

/// search bar for home screen
struct SearchView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View{
        //search bar ar top of home page to search for recipes in the api
        EmptyView()
            .searchable(text: $homeViewModel.searchText, isPresented: $homeViewModel.searchIsActive, prompt: "search for something new")
    }
    
}

