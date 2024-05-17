//
//  IngredientCellView.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import SwiftUI

/// cell view for ingredients, used in the recipe detail views to show ingredients used in each step
struct IngredientCellView: View {
    var ingredient: Ingredient
    var body: some View {
        VStack(alignment: .leading, content: {
            // if the ingredient has an image then get the image from the internet and display it
            if let image = ingredient.image {
                AsyncImage(url: URL(string: image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } placeholder: {
                    // while image is loading show a spinning loading icon in the images place
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            }
            // under the image display the ingredients name
            Text(ingredient.name)
            Spacer()
        })
        .frame(width: 80, height: 100)
    }
}

