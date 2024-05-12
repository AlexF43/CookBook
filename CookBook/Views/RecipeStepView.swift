//
//  RecipeStepView.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import SwiftUI

struct RecipeStepView: View {
    var step: Step
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.25), radius: 2, x: 2, y: 5)

            VStack(alignment: .leading){
         
                Text("Step \(step.number)")
                    .bold()
                Text("\(step.name)")
                Spacer()
                if let ingredients = step.ingredients {
                       Text(ingredients.isEmpty ? "" : "Ingredients")
                           .bold()

                   }
                   ScrollView(.horizontal, showsIndicators: false) {
                       HStack{
                           if let ingredients = step.ingredients {
                               
                               
                               ForEach(ingredients) { ingredient in
                                   IngredientCellView(ingredient: ingredient)
                               }
                           }
                    }.scrollTargetLayout()
                    
                }  .scrollTargetBehavior(.viewAligned)
            }.padding(20)
        }
    }
}

//#Preview {
//    RecipeStepView()
//}
