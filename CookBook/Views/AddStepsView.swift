//
//  AddStepsView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 5/5/2024.
//

import SwiftUI

/// allows the user to add each step of the recipe individually
struct AddStepsView: View {
    @ObservedObject var recipeViewModel: RecipeViewModel
    @State private var step: String = ""
    
    var body: some View {
        VStack{
            
            // adding a user inputted step to the list of steps
            HStack {
                TextField("Step", text: $step)
                    .textFieldStyle(.roundedBorder)
                // button adds the current step to the list
                Button {
                    recipeViewModel.steps.append(Step(number: 0, name: step))
                    step = ""
                } label: {
                    Text("Add")
                        .bold()
                }.buttonStyle(.borderedProminent)
            }.tint(.rose)
            
            //lists each of the recipe's steps by the user. The numbers automatically update
            List {
                ForEach(Array(recipeViewModel.steps.enumerated()), id: \.element) { index, step in
                    HStack{
                        Text("\(index + 1). ")
                        Text("\(recipeViewModel.steps[index].name)")
                        Spacer()
                        
                        // remove button on each of the steps
                        Button {
                            recipeViewModel.steps.remove(at: index)
                        } label: {
                            Text("X")
                                .foregroundColor(.gray)
                                .bold()
                        }
                    }
                }
            }
        }
    }
}
