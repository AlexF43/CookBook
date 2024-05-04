//
//  AddRecipeView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

struct AddRecipeView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredients: [Ingredient] = [Ingredient]()
    @State private var steps: [String] = []

    var body: some View {
        VStack {
//            HStack{
//                VStack{
                    TextField("Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .controlSize(.large)

                    TextField("Description", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("ingredients")
            
//            Button("Add"){
//
//            }
            NavigationLink("Add"){
                AddIngredientView(ingredients: ingredients)
            }

//                }
//                Rectangle()
//                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
//                    .frame(width: 150, height: 150)
//            }
           
            Spacer()
                Button("Save") {
                    let newRecipe = Recipe(id: 2, title: title, description: description, imgUrl: "//imageURL", cookingTime: 15, ingredients: ingredients, steps: steps)
                    modelContext.insert(newRecipe)
                    CookBookView()
                }
        
        }.navigationTitle("Add Your Own Recipe")
            .padding(20)
        
    }
    
    //to insert a new recipe into the database:
    //make a new recipe object using smth like newRecipe = Recipe(ingredients ect)
    //insert into database using "modelContext.insert(newRecipe)"
}

//#Preview {
//    AddRecipeView()
//}
