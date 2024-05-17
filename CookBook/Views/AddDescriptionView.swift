//
//  AddDescriptionView.swift
//  CookBook
//
//  Created by Rhianna McCormack on 5/5/2024.
//

import SwiftUI
import PhotosUI

/// view for adding the description to a recipe that is input by the user
struct AddDescriptionView: View {
    @State private var recipeImageItem: PhotosPickerItem?
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    
                    // photos picker that allows a user to select an image from their camera roll
                    PhotosPicker(selection: $recipeImageItem, matching: .images) {
                        // if an image has been selected display it
                        if let recipeImageData = recipeViewModel.imageData,
                           let uiImage = UIImage(data: recipeImageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250, alignment: .center)
                            
                        } else {
                            // if no image has been selected then show a default camera icon
                            ZStack{
                                Rectangle()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .foregroundColor(.lighterGray)
                                Image(systemName: "camera")
                                    .tint(.rose)
                                    .bold()
                            }
                        }
                        
                    }
                    Spacer()
                }.padding([.bottom], 20)
                
                // adding title
                Text("Add a Title")
                    .multilineTextAlignment(.leading)
                    .bold()
                    .foregroundColor(.rose)
                
                TextField("Title", text: $recipeViewModel.title,  axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .controlSize(.large)
                    .padding([.bottom], 20)
                
                // adding description
                Text("Add Description")
                    .multilineTextAlignment(.leading)
                    .bold()
                    .foregroundColor(.rose)
                
                TextField("Description", text: $recipeViewModel.description, axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.bottom], 20)
            
                // adding cooking time
                Text("Cooking Time")
                    .multilineTextAlignment(.leading)
                    .bold()
                    .foregroundColor(.rose)
                
                HStack {
                    TextField("Cooking Time", text: $recipeViewModel.cookingTime)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100)
                    
                    Text("MINS")
                }.padding([.bottom], 20)

            }
            
            // when the recipeImageItem from the photo picker is changed then try and convert the image into raw data form which can be stored by swiftdata
            .onChange(of: recipeImageItem) {
                Task {
                    // try to convert the image to data
                    if let loaded = try? await recipeImageItem?.loadTransferable(type: Data.self) {
                        recipeViewModel.imageData = loaded
                    } else {
                        print("Failed")
                    }
                }
            }
            
        }
    }
}

