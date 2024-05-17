//
//  HomeContentView.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import SwiftUI
import SwiftData
/// the main and default screen for the app
struct HomeContentView: View {
    
    // swiftdata response of recipes ordered from newest added to oldest
    @Query(sort: \Recipe.dateTimeAdded, order: .reverse) private var recipes: [Recipe]
    // random trivia from the api
    @State private var triviaResponse: String?
    // random recipes from the api
    @State private var randomRecipes: [Recipe] = []
    // conains the editors favourite recipes to display
    var editorPicks: [Recipe] = EditorPicksRecipes().editorPicks
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading) {
                    
                    Text("Find Recipes")
                        .bold()
                        .font(.system(size: 30))
                        .padding([.top], 20)
                    
                    // if there there are any recipes in the recipe list then display them in the order of most recently saved to least
                    if (!recipes.isEmpty) {
                        Text("Recently Saved")
                            .bold()
                        
                        // horizontal scroll view containing the each recipe in a cell view which when clicked on takes the user to that recipes detail view
                        ScrollView(.horizontal, showsIndicators: false) {
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
                    
                    // if there are random recipes (if they were able to be fetched from the api) then display them
                    if (!randomRecipes.isEmpty) {
                        Text("Try something new")
                            .bold()
                            .padding([.top], 20)
                        
                        // horizontal scroll view containing the each recipe in a cell view which when clicked on takes the user to that recipes detail view
                        ScrollView(.horizontal, showsIndicators: false) {
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
                    }
                    
                    // if the editors picks list is not empty then display them
                    if (!editorPicks.isEmpty) {
                        Text("Editor's Picks")
                            .bold()
                            .padding([.top], 20)
                        
                        // horizontal scroll view containing the each recipe in a cell view which when clicked on takes the user to that recipes detail view
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(editorPicks) { recipe in
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
                    
                    // if the trivia is not nil then display it
                    if let trivia = triviaResponse {
                        Text("Fun trivia fact")
                            .bold()
                            .padding([.top], 20)
                        
                        Text(trivia)
                            .italic()
                            .foregroundColor(.gray)
                    }
                }
                
            }.navigationTitle("Home")
                .padding(10)
        }
        //gets the trivia and the random recipes from the api when the screen appears if they do not already exist
        .onAppear() {
            if (triviaResponse == nil) {
                RecipeSearchService().getRandomFoodTrivia() { randomTrivia in
                    triviaResponse = randomTrivia
                }
            }
            
            if (randomRecipes.isEmpty) {
                RecipeSearchService().getRandomRecipes() { recipes in
                    randomRecipes = recipes
                }
            }
        }
        
    }
}
