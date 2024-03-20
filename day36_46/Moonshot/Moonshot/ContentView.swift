//
//  ContentView.swift
//  Moonshot
//
//  Created by jason on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var gridLayout = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if gridLayout {
                    MoonshotGridView(astronauts: astronauts, missions: missions)
                } else {
                    MoonshotListView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .toolbar {
                Toggle("Grid", isOn: $gridLayout)
                    .toggleStyle(SwitchToggleStyle())
                    .tint(.white.opacity(0.5))
            }
        }
    }
}

#Preview {
    ContentView()
}
