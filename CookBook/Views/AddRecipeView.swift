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
    @State private var recipeViewModel = RecipeViewModel()
    @State private var tabSelection: Int = 0
    let tabOptions: [String] = ["DESC", "INGREDIENTS", "STEPS"]
    @State private var saved: Bool = false

    var body: some View {
        VStack {
            HStack(){
                Spacer()
                    ForEach (tabOptions.indices, id: \.self ) { index in
                        Text("\(tabOptions[index])")
                            .fontWeight(tabOptions[index] == tabOptions[tabSelection] ? .bold : .regular)
    //                        .frame(maxWidth: .infinity)
                            .border(Color.black, width: tabOptions[index] == tabOptions[tabSelection] ? 1 : 0)
            
                }
                Spacer()
            }
            
            Divider()
            TabView(selection: $tabSelection) {

                AddDescriptionView(recipeViewModel: recipeViewModel)
                    .tabItem(){
                        Text("DESC")
                    }.tag(0)
                AddIngredientView(recipeViewModel: recipeViewModel)
                    .tabItem(){
                        Text("INGREDIENTS")
                    }.tag(1)
                AddStepsView(recipeViewModel: recipeViewModel)
                    .tabItem(){
                        Text("STEPS")
                    }.tag(2)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            

            Spacer()
            
                Button("Save") {
                    let newRecipe = Recipe(id: 2, title: title, description: description, imgUrl: "//imageURL", cookingTime: 15, ingredients: ingredients, steps: steps)
                    modelContext.insert(newRecipe)
                    print("added recipe")
                    saved = true
                    CookBookView()
                }.buttonStyle(.borderedProminent)
                .disabled(recipeViewModel.title.isEmpty || recipeViewModel.description.isEmpty || recipeViewModel.ingredients.isEmpty || recipeViewModel.steps.isEmpty)
        
        }.navigationTitle("New Recipe")
            .padding(20)
        NavigationLink(destination: CookBookView(), isActive: $saved) { EmptyView() }
    }
    
    //to insert a new recipe into the database:
    //make a new recipe object using smth like newRecipe = Recipe(ingredients ect)
    //insert into database using "modelContext.insert(newRecipe)"
}

//#Preview {
//    AddRecipeView()
//}
