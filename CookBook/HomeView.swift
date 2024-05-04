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
    @State var recipesFromRequest: [Recipe]
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Home")
                NavigationLink(
                    destination: CookBookView(),
                    label: {Text("CookBook")
                    }
                )
                    NavigationLink(
                        destination: AddRecipeView(),
                        label: {Text("Add Recipe")
                        }
                    )
            
                }
                .task {
                    
                    getRecipes(searchTerm: "pasta") { recipes in
                        print("got som recipes")
                    }
               }
            }
            
        }
    }



#Preview {
    HomeView(recipesFromRequest: [])
}
