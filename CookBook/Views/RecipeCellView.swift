//
//  RecipeCellView.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import SwiftUI

/// Cell view showing an image and title of the respective recipe
struct RecipeCellView: View {
    var recipe: Recipe
    var body: some View {
        ZStack{
            // background rounded rectangle with a shaddow around the edges
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.25), radius: 2, x: 2, y: 5)
            
            
            VStack(alignment: .leading, content: {
                // displays either an image from the url or a user imported image depending on if the recipe originated from the user or the api
                if let imageData = recipe.userImportedImage {
                    let uiImage = UIImage(data: imageData)
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .padding([.top], 10)
                        .cornerRadius(20)
                    
                } else {
                    AsyncImage(url: URL(string: recipe.imgUrl ?? "")) { image in
                        image.image?.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .padding([.top], 10)
                            .cornerRadius(20)
                    }
                }
                
                Text(recipe.title)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            })
        }
        // frame which the cell will always fit inside
        .frame(width: 120, height: 170)
    }
}

