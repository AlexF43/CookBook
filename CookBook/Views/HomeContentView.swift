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
    var body: some View {
        //    @State var recipesFromSearch: [Recipe]
        
        NavigationStack{
            
            
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
                
//                Button("remove recipes"){
//                    for recipe in recipes {
//                        modelContext.delete(recipe)
//                    }
//                }
                
            }
        }
                
    }
}

#Preview {
    HomeContentView(homeViewModel: HomeViewModel())
}
