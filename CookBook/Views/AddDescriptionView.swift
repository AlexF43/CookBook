//
//  AddDescriptionView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 5/5/2024.
//

import SwiftUI

struct AddDescriptionView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var cookingTime: String = ""
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        VStack{
            TextField("Title", text: $recipeViewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .controlSize(.large)
            
            TextField("Description", text: $recipeViewModel.description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Cooking Time", text: $recipeViewModel.cookingTime)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        
    }
}

//#Preview {
//    AddDescriptionView()
//}
