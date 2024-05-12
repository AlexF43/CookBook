//
//  RecipeDetailView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

struct RecipeDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var savedRecipes: [Recipe]
    @State var recipe: Recipe
    var body: some View {
        ScrollView{
//            if let imageData = recipe.userImportedImage {
//                let uiImage = UIImage(data: imageData)
//                 Image(uiImage: uiImage ?? UIImage())
        
//            } else {
                AsyncImage(url: URL(string: recipe.imgUrl ?? "")) { image in
                    image.image?.resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .padding(0)
//                }
            }
           
            
            Text(recipe.title)
                .font(.title)
                .padding(10)
            
            if let description = recipe.desc {
                Text("\"\(description)\"")
                    .foregroundColor(.gray)
                    .italic()
            }
            
           
            
            HStack{
                Image(systemName: "clock")
                    .foregroundColor(.gray)
                Text("\(recipe.cookingTime ?? 0) MINS")
                    .foregroundColor(.gray)
            }
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .foregroundColor(.rose)

                        .font(.system(size: 20, weight: .bold))
                    if let ingredients = recipe.ingredients {
                        ForEach(ingredients ) { ingredient in
                            Text(ingredient.descName ?? "")
                            
                        }
                    }
                }.padding(20)
                Spacer()
            }
            HStack{
                Text("Steps")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.rose)
                    .padding([.leading], 20)
                Spacer()
            }

            ScrollView(.horizontal) {
                LazyHStack {
                    if let steps = recipe.steps {
                        ForEach(steps) { step in
                            RecipeStepView(step: step)
                                .frame(width: 300, height: 300)
                        }
                    }
                }
                .scrollTargetLayout()
            }.frame(height: 350)
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, 40)
            
//            HStack {
//                VStack (alignment: .leading) {
//                    Text("Method")
//                        .font(.system(size: 20, weight: .bold))
//                    if let steps = recipe.steps {
//                        ForEach(steps.indices) { index in
//                            Text("\(index + 1). \(steps[index].name)")
//                        }
//                        
//                    } else {
//                        Text("no steps found")
//                    }
//                }.padding(20)
//                Spacer()
//            }
            Button("save recipe") {
                modelContext.insert(recipe)
            }.buttonStyle(.borderedProminent)
                .padding(20)
            
        }
        .onAppear() {
            if let currentRecipe = savedRecipes.first(where: {$0.apiId == recipe.apiId}) {
                recipe = currentRecipe
            } else {
                RecipeSearchService().getDetailedRecipe(recipeId: "\(recipe.apiId!)") { detailedRecipe in
                    recipe = detailedRecipe
                }
            }
        }
    }
}


//#Preview {
//    RecipeDetailView(recipe: Recipe(id: 1, title: "Cheesy Pasta", description: "pasta with cheese", imgUrl: "https://www.thediaryofarealhousewife.com/wp-content/uploads/2019/10/Cheesy-Chicken-Pasta-dinner-recipe.jpg", cookingTime: 20, ingredients: [Ingredient(name: "Cheese", amount: 2, unit: "pieces", descName: "2 pieces of cheese")], steps: ["1. cook pasta", "2. place cheese"]))
//}
