//
//  HomeContentView.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import SwiftUI
import SwiftData

struct HomeContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var trivia: String = ""
    @State private var tabSelection = 0
    var body: some View {
        //    @State var recipesFromSearch: [Recipe]
        
        NavigationStack{
            
            
            VStack{
//                Text("Home")
//                NavigationLink(
//                    destination: CookBookView(),
//                    label: {Text("CookBook")
//                    }
//                    
//                )
//                NavigationLink(
//                    destination: AddRecipeView(),
//                    label: {Text("Add Recipe")
//                    }
//                )
                
                Text(trivia)
            }.navigationTitle("Home")
//                .toolbar {
//                    ToolbarItemGroup(placement: .bottomBar) {
//                        
//                    }
//                }

        }.onAppear() {
            print("hello")
            getRandomFoodTrivia() { randomTrivia in
                trivia = randomTrivia
            }
        }
        
    }
}

#Preview {
    HomeContentView(homeViewModel: HomeViewModel())
}
