//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by jason on 3/11/24.
//

import SwiftUI

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
    }
}

extension View {
    func prominentTitleStyle() -> some View {
        modifier(ProminentTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("This is a prominent title!")
            .prominentTitleStyle()
        Image(systemName: "circle.fill")
            .prominentTitleStyle()
    }
}

#Preview {
    ContentView()
}
