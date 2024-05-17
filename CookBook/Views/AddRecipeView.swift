//
//  AddRecipeView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

// root view for adding a recipe, contains each of the child views which are able to be selected between to edit specific parts of each recipe
struct AddRecipeView: View {
    // swift data model context used to make changes to the database
    @Environment(\.modelContext) private var modelContext
    
    // model of the recipe being created, also contains functions to save the recipe
    @StateObject private var recipeViewModel = RecipeViewModel()
    @State private var tabSelection: Int = 0
    let tabOptions: [String] = ["DESC", "INGREDIENTS", "STEPS"]

    var body: some View {
        NavigationStack {
            VStack {
                // HStack containing all of the selectable tabs
                HStack(spacing: 0){
                    Spacer()
                    // list all of the tab options with the currently selected one being bolded
                    ForEach (tabOptions.indices, id: \.self ) { index in
                        VStack{
                            Text("\(tabOptions[index])")
                            // bold the current selected tab
                                .font(.system(size: 14, weight: tabOptions[index] == tabOptions[tabSelection] ? .bold : .regular))
                                .frame(maxWidth: index == 1 ? UIScreen.main.bounds.width * 0.5 : UIScreen.main.bounds.width * 0.25)
                                .foregroundColor(.rose)
                                .onTapGesture {
                                    tabSelection = index
                                }
                            Rectangle()
                                .padding(0)
                                .frame(height: 2)
                                .foregroundColor(tabOptions[index] == tabOptions[tabSelection] ? .rose : .clear)
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                
                // shows the current selected child view
                TabView(selection: $tabSelection) {
                    AddDescriptionView(recipeViewModel: recipeViewModel)
                        .padding(10)
                        .tabItem(){}
                        .tag(0)
                    AddIngredientView(recipeViewModel: recipeViewModel)
                        .padding(10)
                        .tabItem(){}
                        .tag(1)
                    AddStepsView(recipeViewModel: recipeViewModel)
                        .padding(10)
                        .tabItem(){}
                        .tag(2)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                Spacer()
                
                // save button that is only enabled when all fields are filled out
                Button("Save") {
                    saveRecipe()
                }.buttonStyle(.borderedProminent)
                    .disabled(recipeViewModel.title.isEmpty || recipeViewModel.description.isEmpty || recipeViewModel.ingredients.isEmpty || recipeViewModel.steps.isEmpty)
                
                // automatically navigates to the cookbookview when the recipe is saved
                NavigationLink(destination: CookBookView(), isActive: $recipeViewModel.saved) { EmptyView() }
            }
            // New Recipe title
            .navigationTitle("New Recipe")
                .padding(10)
        }
    }
    
    // creates a recipe object from all the entered data and saves it to the swiftdata database
    func saveRecipe() {
        recipeViewModel.updateStepNumbers()
        let newRecipe = recipeViewModel.createRecipe()
        modelContext.insert(newRecipe)
        recipeViewModel.saved = true
    }
}

