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
                            ForEach(1..<13) { pick in
                                ZStack{
                                    Rectangle()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.gray)
                                    
                                    Text("\(pick)")
                                    
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
//                                ZStack{
//                                    Rectangle()
//                                        .frame(width: 100, height: 100)
//                                        .foregroundColor(.gray)
//                                    
//                                    Text("\(pick)")
//                                    
//                                }
                                RecipeCellView(recipe: recipe)
                            }
                        }
                    }
                    Text("Editor's Picks")
                        .bold()
                        .padding([.top], 20)

                    
                    ScrollView(.horizontal, showsIndicators: false) { // These will be set by us
                        HStack{
                            ForEach(1..<13) { pick in
                                RecipeCellView(recipe: Recipe(id: 0, title: "new recipe", description: "test", imageUrl: "https://sallysbakingaddiction.com/wp-content/uploads/2019/11/homemade-sandwich-bread.jpg", imageData: nil, cookingTime: 20, ingredients: [], steps: [], stepStrings: nil))
                                    .frame(height: 200)
                            }
                        }
                    }
                    
                    Text("Feeling Lucky?")
                        .bold()
                        .font(.system(size: 30))
                        .padding([.top], 20)
                    
                    Text("Circle or animated text, seen in things like casino machines")
                    
                 
                Text("Fun trivia fact")
                    .bold()
                    .padding([.top], 20)
                        
                Text(trivia)
                    .italic()
                    .foregroundColor(.gray)
                        
                }.navigationTitle("Home")
                 .padding(10)
            }
                
            }.onAppear() {
                print("hello")
//                RecipeSearchService().getRandomFoodTrivia() { randomTrivia in
//                    trivia = randomTrivia
//                }
//                
//                RecipeSearchService().getRandomRecipes() { recipes in
//                    randomRecipes = recipes
//                }
                
//                RecipeSearchService().getDetailedRecipe(recipeId: "654959") { recipe in
//                    let recipe = recipe
//                }
        }
    }
}
    
#Preview {
    HomeContentView(homeViewModel: HomeViewModel())
}
