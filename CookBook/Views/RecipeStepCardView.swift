//
//  RecipeStepView.swift
//  CookBook
//
//  Created by Alex Fogg on 12/5/2024.
//

import SwiftUI

/// view showing the step instructions and ingredients for a single step in the recipe detail view
struct RecipeStepCardView: View {
    var step: Step
    var body: some View {
        
        ZStack {
            // background rectangle with shaddow
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.25), radius: 2, x: 2, y: 5)
            
            
            VStack(alignment: .leading){
                // step name and number at top of card
                Text("Step \(step.number)")
                    .bold()
                HStack {
                    Text("\(step.name)")
                    Spacer()
                }
                Spacer()
                
                // if ingredients exist then show their images and name in a horizontally scrolling carrosel
                if let ingredients = step.ingredients {
                    if (!ingredients.isEmpty) {
                        Text("Ingredients")
                            .bold()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                
                                // show each ingredient in their individual ingredient cell
                                ForEach(ingredients) { ingredient in
                                    IngredientCellView(ingredient: ingredient)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                    }
                }
            }
            .padding(20)
        }
    }
}

