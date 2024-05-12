//
//  RecipeDetailView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

struct RecipeDetailView: View {
    @State var recipe: Recipe
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: recipe.imgUrl ?? "ay")) { image in
                image.image?.resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .padding(0)
            }
            
            Text(recipe.title)
                .font(.title)
                .padding(10)
            
            Text("\"\(recipe.desc ?? "No description")\"")
                .foregroundColor(.gray)
                .italic()
            
            HStack{
                Image(systemName: "clock")
                    .foregroundColor(.gray)
                Text("\(recipe.cookingTime ?? 0) MINS")
                    .foregroundColor(.gray)
            }
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.system(size: 20, weight: .bold))
                    if let ingredients = recipe.ingredients {
                        ForEach(ingredients ) { ingredient in
                            Text(ingredient.descName ?? "")
                            
                        }
                    }
                }.padding(20)
                Spacer()
            }
            HStack {
                VStack (alignment: .leading) {
                    Text("Method")
                        .font(.system(size: 20, weight: .bold))
                    if let steps = recipe.steps {
                        ForEach(steps.indices) { index in
                            Text("\(index + 1). \(steps[index].name)")
                        }
                        
                    } else {
                        Text("no steps found")
                    }
                }.padding(20)
                Spacer()
            }
            
        }
        .onAppear() {
            if(recipe.apiId != nil) {
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
