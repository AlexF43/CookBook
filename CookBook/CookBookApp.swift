//
//  CookBookApp.swift
//  CookBook
//
//  Created by Alex Fogg on 29/4/2024.
//

import SwiftUI
import SwiftData

@main
struct CookBookApp: App {

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        //injects the swiftdata storage for recipes into the project so they can be accessed from anywhere
        .modelContainer(for: Recipe.self)
    }
}
