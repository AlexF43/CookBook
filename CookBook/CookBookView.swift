//
//  CookBookView.swift
//  CookBook
//
//  Created by Alex Fogg on 30/4/2024.
//

import SwiftUI
import SwiftData

struct CookBookView: View {
//    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("yay")
    }
}

#Preview {
    CookBookView()
}
