//
//  RecipeDetailView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

struct RecipeDetailView: View {
    // the swifdata database object and the list of recipes stored inside
    @Environment(\.modelContext) private var modelContext
    @Query private var savedRecipes: [Recipe]
    
    // the current recipe the view is using as its datasource
    @State var recipe: Recipe
    var body: some View {
        ScrollView {
            
            // displays either an image from the url or a user imported image depending on if the recipe originated from the user or the api
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
                        .frame(height: 300)
                }
            }
            
            Text(recipe.title)
                .font(.title)
                .padding(10)
            
            // display the recipe description if it is not null in the current recipe
            if let description = recipe.desc {
                Text("\"\(description)\"")
                    .foregroundColor(.gray)
                    .italic()
            }
            
            // display the cooking time if it is not null in the current recipe
            if let time = recipe.cookingTime {
                HStack{
                    Image(systemName: "clock")
                        .foregroundColor(.gray)
                    Text("\(time) MINS")
                        .foregroundColor(.gray)
                }
            }
            
            // display the ingredients if they are provied in the recipe model
            if let ingredients = recipe.ingredients {
                HStack {
                    VStack (alignment: .leading) {
                        Text("Ingredients")
                            .foregroundColor(.rose)
                            .font(.system(size: 20, weight: .bold))
                        
                        // list each ingredient one by one
                        ForEach(ingredients ) { ingredient in
                            Text(ingredient.descName ?? "")
                        }
                    }.padding(20)
                    // spacer to push ingredients inline left
                    Spacer()
                }
            }
            
            HStack{
                Text("Steps")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.rose)
                    .padding([.leading], 20)
                Spacer()
            }
            
            // if the steps are provieded then display each of them in a horizontal scrollview that snaps to keep the current step centered on the screen
            if let steps = recipe.steps {
                ScrollView(.horizontal) {
                    LazyHStack {
                        
                        // display an individual recipe card for each step
                        ForEach(steps) { step in
                            RecipeStepCardView(step: step)
                                .frame(width: 300, height: 300)
                        }
                    }
                    .scrollTargetLayout()
                }
                .frame(height: 350)
                // snaps the scrollview to keep the current step in the middle of the screen
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 40)
            }
            
        }
        .onAppear() {
            // if the current recipe can be found in the database then load it
            if let currentRecipe = savedRecipes.first(where: {$0.id == recipe.id}) {
                recipe = currentRecipe
            } else {
                if let id = recipe.apiId {
                // if not then load it from the api using the api id
                    RecipeSearchService().getDetailedRecipe(recipeId: "\(id)") { detailedRecipe in
                        recipe = detailedRecipe
                    }
                }
            }
        }
        .toolbar {
            // save/unsave button
            Button {
                // if the recipe is in the database then delete it on button press
                if let _ = savedRecipes.first(where: {$0.id == recipe.id}) {
                    modelContext.delete(recipe)
                } else {
                    // if the recipe is not in the database then make a new recipe with the same attributes, store it in the database and set the new recipe to be the datasource for this detail page
                    let newRecipe = Recipe(id: recipe.apiId, title: recipe.title, imageUrl: recipe.imgUrl, imageData: recipe.userImportedImage, cookingTime: recipe.cookingTime ?? 0, ingredients: recipe.ingredients, steps: recipe.steps)
                    modelContext.insert(newRecipe)
                    recipe = newRecipe
                }
            } label: {
                ZStack {
                    //button label which has a filled heart if the recipe is saved and an unfilled one if it is not
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
