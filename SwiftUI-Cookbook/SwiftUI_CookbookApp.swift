//
//  SwiftUI_CookbookApp.swift
//  SwiftUI-Cookbook
//  
//  Created by t-watanabe on 2024/09/12.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_CookbookApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
