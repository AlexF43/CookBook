//
//  IngredientCellView.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import SwiftUI

struct IngredientCellView: View {
    var ingredient: Ingredient
    var body: some View {
        VStack(alignment: .leading, content: {
            AsyncImage(url: URL(string: ingredient.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 60, height: 60)
                }
            Text(ingredient.name)
            Spacer()
        })
        .frame(width: 80, height: 100)
    }
}

//#Preview {
//    IngredientCellView(ingredient: <#T##Ingredient#>)
//}
