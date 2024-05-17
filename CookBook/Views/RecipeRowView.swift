//
//  RecipeRowView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 3/5/2024.
//

import SwiftUI

//Shows each recipe in the cookbook as an individual view
struct RecipeRowView: View {
    var recipe: Recipe;
    var body: some View {
        HStack{
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
            VStack(alignment: .leading, content: {
                
                Text(recipe.title)
                    .font(.system(size: 20, weight: .bold))
                Text(recipe.desc ?? "")
                    .foregroundColor(.gray)
                
                if(recipe.cookingTime != nil) {
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.gray)
                        Text("\(recipe.cookingTime ?? 0) MINS")
                            .foregroundColor(.gray)
                    }
                }
            })
        }.padding(0)
    }
}

//#Preview {
////    RecipeRowView()
//    RecipeRowView(recipe: r)
//}
