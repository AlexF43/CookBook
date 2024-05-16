//
//  HomeRecipeVie3w.swift
//  CookBook
//
//  Created by Rhianna McCormack on 12/5/2024.
//

import SwiftUI

struct HomeRecipeView: View {
    var recipe: Recipe
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.black)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .shadow(color: .black, radius: 1)
                .frame(width: 150, height: 400)
            VStack {
                if let url = recipe.imgUrl {
                    AsyncImage(url: URL(string: url)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                }
                Text("\(recipe.title)")
            }.padding([.trailing], 10)
            
        }

    }
       
    
}
