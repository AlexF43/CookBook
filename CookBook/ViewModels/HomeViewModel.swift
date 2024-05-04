//
//  HomeViewModel.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchIsActive: Bool = false
    
}
