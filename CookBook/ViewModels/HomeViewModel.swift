//
//  HomeViewModel.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import Foundation

/// view model for home screen
class HomeViewModel: ObservableObject {
    // text currently in search bar
    @Published var searchText: String = ""
    // if the search bar is currently selected
    @Published var searchIsActive: Bool = false
    
}
