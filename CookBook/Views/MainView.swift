//
//  ToolBarView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 11/5/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Label("Recipes", systemImage: "newspaper.fill")
                }
                .tag(0)
            
            CookBookView()
                .tabItem {
                    Label("Cookbook", systemImage: "book")
                }
                .tag(1)
            
        }    }
}

#Preview {
    MainView()
}
