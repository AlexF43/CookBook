//
//  ToolBarView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 11/5/2024.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelection = 1
    var body: some View {
        TabView {
            AddRecipeView()
                .tabItem{
                    Label("Add", systemImage: "plus.circle")
                }
                .tag(0)
            
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                .tag(1)
            
            CookBookView()
                .tabItem {
                    Label("Cookbook", systemImage: "book")
                }
                .tag(2)
            
        }
    }
}

#Preview {
    MainView()
}
