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
    @Query(sort: \Recipe.dateTimeAdded, order: .reverse) private var recipes: [Recipe]
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var trivia: String?
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var tabSelection = 0
    @State private var randomRecipes: [Recipe] = []
    var body: some View {
        //    @State var recipesFromSearch: [Recipe]
        
        NavigationStack{
            
            ScrollView{
                VStack(alignment: .leading) {
                    
                    Text("Find Recipes")
                        .bold()
                        .font(.system(size: 30))
                        .padding([.top], 20)
                    
                    Text("Recently Saved")
                        .bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) { //These ones will be random
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
                            ForEach(1..<10) { pick in
                                NavigationLink {
                                    RecipeDetailView(recipe: Recipe(id: 0, title: "new recipe", description: "test", imageUrl: "https://sallysbakingaddiction.com/wp-content/uploads/2019/11/homemade-sandwich-bread.jpg", imageData: nil, cookingTime: 20, ingredients: [], steps: [], stepStrings: nil))
                                } label: {
                                    RecipeCellView(recipe: Recipe(id: 0, title: "new recipe", description: "test", imageUrl: "https://sallysbakingaddiction.com/wp-content/uploads/2019/11/homemade-sandwich-bread.jpg", imageData: nil, cookingTime: 20, ingredients: [], steps: [], stepStrings: nil))
                                        .frame(height: 200)
                                }
                            }
                        }
                    }
                    
//                    Text("Feeling Lucky?")
//                        .bold()
//                        .font(.system(size: 30))
//                        .padding([.top], 20)
//                    
//                    Text("Circle or animated text, seen in things like casino machines")
                    
                 
                Text("Fun trivia fact")
                    .bold()
                    .padding([.top], 20)
                        
                Text(trivia ?? "")
                    .italic()
                    .foregroundColor(.gray)
                        
                }.navigationTitle("Home")
                 .padding(10)
            }
                
            .onAppear() {
                print("hello")
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
    }
}
    
#Preview {
    HomeContentView(homeViewModel: HomeViewModel())
}
