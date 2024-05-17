//
//  RecipeRowView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 3/5/2024.
//

import SwiftUI

/// used to show each recipe in the cookbook as an individual row
struct RecipeRowView: View {
    var recipe: Recipe;
    var body: some View {
        HStack{
            // displays either an image from the url or a user imported image depending on if the recipe originated from the user or the api
            if let recipeImage = recipe.userImportedImage,
               let uiImage = UIImage(data: recipeImage) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            if let recipeImage = recipe.imgUrl {
                AsyncImage(url: URL(string: recipeImage)) { image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
            }
            
            // to the right of the image display the recipes title, description and cooking time if provided
            VStack(alignment: .leading, content: {
                
                Text(recipe.title)
                    .font(.system(size: 20, weight: .bold))
                
                if let description = recipe.desc {
                    Text(description)
                        .foregroundColor(.gray)
                }
                
                if let cookingTime = recipe.cookingTime {
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.gray)
                        Text("\(cookingTime) MINS")
                            .foregroundColor(.gray)
                    }
                }
            })
        }.padding(0)
    }
}
