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
//    let columns = [GridItem(.flexible()), GridItem(.flexible())]
//    @State private var tabSelection = 0
    @State private var randomRecipes: [Recipe] = []
    var body: some View {
        
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
                            //                            ForEach(1..<10) { pick in
                            NavigationLink {
                                RecipeDetailView(recipe: Recipe(id: 0, title: "new recipe", description: "test", imageUrl: "https://sallysbakingaddiction.com/wp-content/uploads/2019/11/homemade-sandwich-bread.jpg", imageData: nil, cookingTime: 20, ingredients: [], steps: []))
                            } label: {
                                RecipeCellView(recipe: Recipe(id: 0, title: " Crispy Chicken Tacos", description: "test", imageUrl: "https://img.taste.com.au/U-djJurP/w720-h480-cfill-q80/taste/2018/01/crispy-chicken-tacos-134732-1.jpg", imageData: nil, cookingTime: 20, ingredients: [], steps: []))
                                    .frame(height: 200)
                            }
                            
                            NavigationLink {
                                RecipeDetailView(recipe: Recipe(id: 0, title: "new recipe", description: "test", imageUrl: "https://sallysbakingaddiction.com/wp-content/uploads/2019/11/homemade-sandwich-bread.jpg", imageData: nil, cookingTime: 20, ingredients: [], steps: []))
                            } label: {
                                RecipeCellView(recipe: Recipe(id: 0, title: " Cheesy Potato and Bacon Lasagne", description: "test", imageUrl: "https://img.taste.com.au/0OZ2-PBz/w720-h480-cfill-q80/taste/2018/06/cheesy-potato-and-bacon-lasagne-138403-1.jpg", imageData: nil, cookingTime: 20, ingredients: [], steps: []))
                                    .frame(height: 200)
                            }
                            
                            NavigationLink {
                                RecipeDetailView(recipe: Recipe(id: 0, title: "new recipe", description: "test", imageUrl: "https://sallysbakingaddiction.com/wp-content/uploads/2019/11/homemade-sandwich-bread.jpg", imageData: nil, cookingTime: 20, ingredients: [], steps: []))
                            } label: {
                                RecipeCellView(recipe: Recipe(id: 0, title: "Classic Chewy Brownies", description: "test", imageUrl: "https://img.taste.com.au/5hsR3Ore/w720-h480-cfill-q80/taste/2016/11/classic-chewy-brownie-102727-1.jpeg", imageData: nil, cookingTime: 20, ingredients: [], steps: []))
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

    
#Preview {
    HomeContentView(homeViewModel: HomeViewModel())
}
