//
//  AddStepsView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 5/5/2024.
//

import SwiftUI

struct AddStepsView: View {
    @ObservedObject var recipeViewModel: RecipeViewModel
    @State private var step: String = ""
    @State private var steps = [String]()
    var body: some View {
        VStack{
            HStack {
                TextField("Step", text: $step)
                    .textFieldStyle(.roundedBorder)
                Button {
                    recipeViewModel.steps.append(step)
                    step = ""
                } label: {
                    Text("Add")
                        .bold()
                }.buttonStyle(.borderedProminent)
            }.tint(.teal)
            List {
                ForEach(Array(recipeViewModel.steps.enumerated()), id: \.element) { index, step in
                    HStack{
                        Text("\(index + 1). ")
                        Text("\(recipeViewModel.steps[index])")
                        Spacer()
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
//
//#Preview {
//    AddStepsView()
//}
