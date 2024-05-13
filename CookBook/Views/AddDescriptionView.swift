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
    //    @State private var imageData: Data?
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    PhotosPicker(selection: $recipeImageItem, matching: .images) {
                        if let recipeImageData = recipeViewModel.imageData,
                           let uiImage = UIImage(data: recipeImageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250, alignment: .center)
                            
                        } else {
                            ZStack{
                                Rectangle()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .foregroundColor(.lightGray)
                                Image(systemName: "camera")
                                    .tint(.rose)
                                    .bold()
                            }
                        }
                        
                    }
                    Spacer()
                }.padding([.bottom], 20)
                
                Text("Add a Title")
                    .multilineTextAlignment(.leading)
                    .bold()
                    .foregroundColor(.rose)
                
                TextField("Title", text: $recipeViewModel.title,  axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .controlSize(.large)
                    .padding([.bottom], 20)
                
              
                
                Text("Add Description")
                    .multilineTextAlignment(.leading)
                    .bold()
                    .foregroundColor(.rose)
                
                TextField("Description", text: $recipeViewModel.description, axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.bottom], 20)

                
            
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
            
            
            .onChange(of: recipeImageItem) {
                Task {
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


//#Preview {
//    AddDescriptionView()
//}
