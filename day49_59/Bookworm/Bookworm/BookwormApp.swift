//
//  BookwormApp.swift
//  Bookworm
//
//  Created by jason on 3/26/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
