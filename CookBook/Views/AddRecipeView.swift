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
        NavigationStack {
            VStack {
                HStack(spacing: 0){
                    Spacer()
                    ForEach (tabOptions.indices, id: \.self ) { index in
                        VStack{
                            Text("\(tabOptions[index])")
                                .font(.system(size: 14, weight: tabOptions[index] == tabOptions[tabSelection] ? .bold : .regular))
                                .frame(maxWidth: index == 1 ? UIScreen.main.bounds.width * 0.5 : UIScreen.main.bounds.width * 0.25)
                                .onTapGesture {
                                    tabSelection = index
                                }
                            Rectangle()
                                .padding(0)
                                .frame(height: 2)
                                .foregroundColor(tabOptions[index] == tabOptions[tabSelection] ? .black : .clear)
                        }
                        Spacer()
                        
                    }
                }.frame(width: UIScreen.main.bounds.width)
                
                //            Rectangle()
                //                .frame(width: UIScreen.main.bounds.width, height: 2)
                
                
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
                //            
                
                Spacer()
                
                Button("Save") {
                    let newRecipe = recipeViewModel.createRecipe()
                    modelContext.insert(newRecipe)
                    saved = true
                }.buttonStyle(.borderedProminent)
                    .disabled(recipeViewModel.title.isEmpty || recipeViewModel.description.isEmpty || recipeViewModel.ingredients.isEmpty || recipeViewModel.steps.isEmpty)
                NavigationLink(destination: CookBookView(), isActive: $saved) { EmptyView() }
                
            }.navigationTitle("New Recipe")
            //            .padding(20)
        }
    }
    
    //to insert a new recipe into the database:
    //make a new recipe object using smth like newRecipe = Recipe(ingredients ect)
    //insert into database using "modelContext.insert(newRecipe)"
}

//#Preview {
//    AddRecipeView()
//}
