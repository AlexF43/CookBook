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
            AsyncImage(url: URL(string: recipe.imgUrl)) { image in
                image.image?.resizable()
                    .frame(width: 100, height: 100)
                    .padding(0)
            }
            VStack(alignment: .leading, content: {
                
                Text(recipe.title)
                    .font(.system(size: 20, weight: .bold))
                Text(recipe.desc ?? "no description")
                    .foregroundColor(.gray)
                
                HStack{
                    Image(systemName: "clock")
                        .foregroundColor(.gray)
                    Text("\(recipe.cookingTime!) MINS")
                        .foregroundColor(.gray)
                }
            }).padding(5)
            .multilineTextAlignment(.leading)
        }.listRowInsets(.init())
    }
}

//#Preview {
////    RecipeRowView()
//    RecipeRowView(recipe: r)
//}
