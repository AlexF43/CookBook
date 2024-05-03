//
//  CookBookView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

struct CookBookView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    var body: some View {
        VStack{
//            Text("CookBook")
//                .font(.title)
            
            Button("recipes"){
                modelContext.insert(Recipe(id: 1, title: "Pasta", description: "Yummy", imgUrl: "https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Spinach-Tomato-Pasta-bowl-500x500.jpg", ingredients: [Ingredient(name: "Pasta", amount: 2, unit: "grams", descName: "2 grams of Pasta")], steps: ["1. Cook Pasta", "2. Eat Pasta"]))
            }
//            Text("wah")
            List{
                ForEach(recipes) { recipe in
                    RecipeRowView(recipe: recipe)
//                    Image(recipe.imgUrl)
//                    Text(recipe.title)
//                    Text(recipe.desc)
                }.onDelete(perform: { indexSet in
                    for index in indexSet {
                        modelContext.delete(recipes[index])
                    }
                })
            }
//            List{
//                HStack{
//                    AsyncImage(url: URL(string: "https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Spinach-Tomato-Pasta-bowl-500x500.jpg")) { image in
//                        image.image?.resizable()
//                            .frame(width: 80, height: 80)
//                            .padding(0)
//                    }
//                    VStack{
//                        Text("Pasta")
//                        Text("wahoo")
//                    }.multilineTextAlignment(.leading)
//                }
//                HStack{
//                    AsyncImage(url: URL(string: "https://media.istockphoto.com/id/185235465/photo/white-toast.jpg?s=612x612&w=0&k=20&c=ZIMknnJMwf9PANFFWeR78s_d72lDLIBi1ZSeunfnE34=")) { image in
//                        image.image?.resizable()
//                            .frame(width: 80, height: 80)
//                            .padding(0)
//                    }
//                    VStack(alignment: .leading, content: {
//                        Text("Toast")
//                            .font(.title)
//                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        Text("Bread but warm")
//                            .foregroundColor(.gray)
//                        
//                    })
//                    .multilineTextAlignment(.leading)
//                }
//
//             
//            }
//        .navigationTitle("CookBook")
        }
    }
}

#Preview {
    CookBookView()
}
