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
        VStack{
            Text("Step \(step.number)")
            Text("\(step.name)")
            Text("Ingredients")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(step.ingredients) { ingredient in
                        IngredientCellView(ingredient: ingredient)
                    }
                }
            }
        }
    }
}

//#Preview {
//    RecipeStepView()
//}
