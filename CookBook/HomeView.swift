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
    
    var body: some View {
        Text("Home")
    }
}


#Preview {
    HomeView()
}
