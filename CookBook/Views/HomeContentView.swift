//
//  HomeContentView.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import SwiftUI
import SwiftData
// the main and default screen for the app
struct HomeContentView: View {

    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Recipe.dateTimeAdded, order: .reverse) private var recipes: [Recipe]
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var trivia: String?
    @State private var randomRecipes: [Recipe] = []
    var editorPicks = EditorPicksRecipes().editorPicks
    
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading) {
                    
                    Text("Find Recipes")
                        .bold()
                        .font(.system(size: 30))
                        .padding([.top], 20)
                     
                    if (!recipes.isEmpty) {
                        Text("Recently Saved")
                            .bold()
                        
                        ScrollView(.horizontal, showsIndicators: false) { //These ones are the most recent saved from the user
                            HStack{
                                ForEach(recipes) { recipe in
                                    NavigationLink {
                                        RecipeDetailView(recipe: recipe)
                                    } label: {
                                        RecipeCellView(recipe: recipe)
                                            .frame(height: 200)
                                    }
                                }
                            }
                        }
                    }
                    Text("Try something new")
                        .bold()
                        .padding([.top], 20)
                    ScrollView(.horizontal, showsIndicators: false) { //These ones will be random
                        HStack{
                            ForEach(randomRecipes) { recipe in
                                NavigationLink {
                                    RecipeDetailView(recipe: recipe)
                                } label: {
                                    RecipeCellView(recipe: recipe)
                                        .frame(height: 200)
                                }
                            }
                        }
                    }
                    Text("Editor's Picks")
                        .bold()
                        .padding([.top], 20)
                    ScrollView(.horizontal, showsIndicators: false) { // These will be set by us
                        HStack{
                            NavigationLink {
                                RecipeDetailView(recipe: editorPicks[0])
                            } label: {
                                RecipeCellView(recipe: editorPicks[0])
                                .frame(height: 200)
                            }
                            
                            NavigationLink {
                                RecipeDetailView(recipe: editorPicks[1])
                                } label : {
                                    RecipeCellView(recipe: editorPicks[1])
                                    .frame(height: 200)
                                }
                        
                            NavigationLink {
                                RecipeDetailView(recipe: editorPicks[2])
                                } label: {
                                RecipeCellView(recipe: editorPicks[2])
                                    .frame(height: 200)
                            }
                        }
                    }
                }
        
                    
                 
                Text("Fun trivia fact")
                    .bold()
                    .padding([.top], 20)
                        
                Text(trivia ?? "")
                    .italic()
                    .foregroundColor(.gray)
                        
                }.navigationTitle("Home")
                 .padding(10)
            }
            //gets the trivia and the random recipes when the screen appears
            .onAppear() {
                if (trivia == nil) {
                    RecipeSearchService().getRandomFoodTrivia() { randomTrivia in
                        trivia = randomTrivia
                    }
                }
                
                if (randomRecipes.isEmpty) {
                    RecipeSearchService().getRandomRecipes() { recipes in
                        randomRecipes = recipes
                    }
                }
            }
                
        }
    
    mutating func populateEditorPicks() {
       
        }
        
    }
    


    
#Preview {
    HomeContentView(homeViewModel: HomeViewModel())
}
