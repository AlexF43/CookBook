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
        VStack{
            PhotosPicker("Upload a picture", selection: $recipeImageItem, matching: .images)
                recipeImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            
            TextField("Title", text: $recipeViewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .controlSize(.large)
            
            TextField("Description", text: $recipeViewModel.description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Cooking Time", text: $recipeViewModel.cookingTime)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .onChange(of: recipeImageItem) {
            Task {
                if let loaded = try? await recipeImageItem?.loadTransferable(type: Image.self) {
//                    if let data =  {
//                        Image(data)
//                    }
//                    recipeImage = UIImage(image: loaded)
                    
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
