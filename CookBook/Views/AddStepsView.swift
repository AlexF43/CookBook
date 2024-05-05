//
//  AddStepsView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 5/5/2024.
//

import SwiftUI

struct AddStepsView: View {
    @State var recipeViewModel: RecipeViewModel
    @State private var step: String = ""
    var body: some View {
        VStack{
            HStack {
                TextField("Step", text: $step)
                Button("Add Step"){
                    recipeViewModel.steps.append(step)
                    print(recipeViewModel.steps.count)
                    step = ""
                }
                
            }
            List(Array(recipeViewModel.steps.enumerated()), id: \.element) { index, step in
                HStack {
                    Text("\(index + 1).")
                    Text(step)
                }
            }
        }
    }
}
//
//#Preview {
//    AddStepsView()
//}
