//
//  RecipeRowView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 3/5/2024.
//

import SwiftUI

struct RecipeRowView: View {
    var recipe: Recipe;
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: "https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Spinach-Tomato-Pasta-bowl-500x500.jpg")) { image in
                image.image?.resizable()
                    .frame(width: 80, height: 80)
                    .padding(0)
            }
            VStack{
                Text(recipe.title)
                Text(recipe.desc)
            }.multilineTextAlignment(.leading)
        }
    }
}

//#Preview {
////    RecipeRowView()
//    RecipeRowView(recipe: r)
//}
