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
            if let imageData = recipe.userImportedImage {
                let uiImage = UIImage(data: imageData)
                 Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .padding(0)
                    .frame(height: 300)
        
            } else {
                AsyncImage(url: URL(string: recipe.imgUrl ?? "")) { image in
                    image.image?.resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .padding(0)
//                }
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
            }
        }
        .onAppear() {
            if let currentRecipe = savedRecipes.first(where: {$0.id == recipe.id}) {
                recipe = currentRecipe
            } else {
                RecipeSearchService().getDetailedRecipe(recipeId: "\(recipe.id)") { detailedRecipe in
                    recipe = detailedRecipe
                }
            }
        }.toolbar {
            Button {
                if let _ = savedRecipes.first(where: {$0.id == recipe.id}) {
                    modelContext.delete(recipe)
                } else {
                    modelContext.insert(recipe)
                }
            } label : {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                    if let _ = savedRecipes.first(where: {$0.id == recipe.id}) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.rose)
                                } else {
                        Image(systemName: "heart")
                            .foregroundColor(.rose)
                     }
                    
                }
            }
        }
    }
    
}


//#Preview {
//    RecipeDetailView(recipe: Recipe(id: 1, title: "Cheesy Pasta", description: "pasta with cheese", imgUrl: "https://www.thediaryofarealhousewife.com/wp-content/uploads/2019/10/Cheesy-Chicken-Pasta-dinner-recipe.jpg", cookingTime: 20, ingredients: [Ingredient(name: "Cheese", amount: 2, unit: "pieces", descName: "2 pieces of cheese")], steps: ["1. cook pasta", "2. place cheese"]))
//}
