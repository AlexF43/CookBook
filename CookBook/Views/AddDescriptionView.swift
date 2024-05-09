//
//  AddDescriptionView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 5/5/2024.
//

import SwiftUI
import PhotosUI

struct AddDescriptionView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var cookingTime: String = ""
    @State private var recipeImageItem: PhotosPickerItem?
    @State private var recipeImage: Image?
    @State private var imageData: Data?
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            Text("Recipe Title")
                .multilineTextAlignment(.leading)
            
            TextField("Title", text: $recipeViewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .controlSize(.large)
            
            Spacer()
            
            Text("Cooking Time (minutes)")
                .multilineTextAlignment(.leading)
                    
            TextField("Cooking Time", text: $recipeViewModel.cookingTime)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            Text("Add Description")
                .multilineTextAlignment(.leading)
            
            TextField("Description", text: $recipeViewModel.description, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            ZStack{
                recipeImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
                PhotosPicker("pick an image", selection: $recipeImageItem, matching: .images)
                    .overlay {
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.red)
                }
            Spacer()
        }
        .onChange(of: recipeImageItem) {
            Task {
                if let loaded = try? await recipeImageItem?.loadTransferable(type: Image.self) {
//                    if let data =  {
//                        Image(data)
//                    }
                    recipeImage = loaded
                    
                } else {
                    print("Failed")
                }
            }
        }
        
    }
}

//#Preview {
//    AddDescriptionView()
//}
