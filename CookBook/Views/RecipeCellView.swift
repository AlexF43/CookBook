//
//  RecipeCellView.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import SwiftUI

struct RecipeCellView: View {
    var recipe: Recipe
    var body: some View {
        VStack(alignment: .leading, content: {
            AsyncImage(url: URL(string: recipe.imgUrl ?? "")) { image in
                image.image?.resizable()
                    .frame(width: 100, height: 100)
                    .padding(0)
            }
            
            Text(recipe.title)
            Spacer()
        })
        .frame(width: 120, height: 160)
    }
}

//#Preview {
//    RecipeCellView()
//}
