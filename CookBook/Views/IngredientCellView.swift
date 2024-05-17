//
//  IngredientCellView.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import SwiftUI

//shows each ingredient, used in the recipe detail views to show ingredients used in each step
struct IngredientCellView: View {
    var ingredient: Ingredient
    var body: some View {
        VStack(alignment: .leading, content: {
            AsyncImage(url: URL(string: ingredient.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            Text(ingredient.name)
            Spacer()
        })
        .frame(width: 80, height: 100)
    }
}

