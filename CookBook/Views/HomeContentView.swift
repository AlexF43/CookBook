//
//  HomeContentView.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import SwiftUI
import SwiftData

struct HomeContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var trivia: String = ""
    @State private var tabSelection = 0
    var body: some View {
        //    @State var recipesFromSearch: [Recipe]
        
        NavigationStack{
            
            ScrollView{
                VStack(alignment: .leading) {
                    
                    Text("Find Recipes")
                        .bold()
                        .font(.system(size: 30))
                        .padding([.top], 20)
                    
                    Text("Recently Saved")
                        .bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) { //These ones will be random
                        HStack{
                            ForEach(1..<13) { pick in
                                ZStack{
                                    Rectangle()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.gray)
                                    
                                    Text("\(pick)")
                                    
                                }
                            }
                        }
                    }
                    
                    Text("Suggested for you")
                        .bold()
                        .padding([.top], 20)

                    
                    ScrollView(.horizontal, showsIndicators: false) { //These ones will be random
                        HStack{
                            ForEach(1..<13) { pick in
                                ZStack{
                                    Rectangle()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.gray)
                                    
                                    Text("\(pick)")
                                    
                                }
                            }
                        }
                    }
                    Text("Editor's Picks")
                        .bold()
                        .padding([.top], 20)

                    
                    ScrollView(.horizontal, showsIndicators: false) { // These will be set by us
                        HStack{
                            ForEach(1..<13) { pick in
                                ZStack{
                                    Rectangle()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.gray)
                                    
                                    Text("\(pick)")
                                    
                                }
                            }
                        }
                    }
                    
                    Text("Feeling Lucky?")
                        .bold()
                        .font(.system(size: 30))
                        .padding([.top], 20)
                    
                    Text("Circle or animated text, seen in things like casino machines")
                    
                
                Text("Fun trivia fact")
                    .bold()
                    .padding([.top], 20)
                        
                Text(trivia)
                    .italic()
                    .foregroundColor(.gray)
                        
                }.navigationTitle("Home")
                 .padding(10)
            }
                
            }.onAppear() {
                print("hello")
                RecipeSearchService().getRandomFoodTrivia() { randomTrivia in
                    trivia = randomTrivia
                }
                
        }
    }
}
    
#Preview {
    HomeContentView(homeViewModel: HomeViewModel())
}
