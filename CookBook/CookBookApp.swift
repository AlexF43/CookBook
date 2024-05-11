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
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Recipe.self)

//        .modelContainer(sharedModelContainer)
    }
}
