//
//  SearchView.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View{
//        Text("Searching for \(homeViewModel.searchText)")
        EmptyView()
            .searchable(text: $homeViewModel.searchText, isPresented: $homeViewModel.searchIsActive, prompt: "search for something new")
    }
    
}

#Preview {
    SearchView(homeViewModel: HomeViewModel())
}
