//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by jason on 3/27/24.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
