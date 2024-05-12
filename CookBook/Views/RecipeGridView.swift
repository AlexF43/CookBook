//
//  RecipeGridView.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import SwiftUI

struct RecipeGridView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: recipe.imgUrl ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(height: 150)
                }
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.red.opacity(0.8))
                    .clipShape(Circle())
                    .padding(8)
            }
            
            Text(recipe.title)
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}

//#Preview {
//    RecipeGridView()
//}
