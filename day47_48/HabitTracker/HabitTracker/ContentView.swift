//
//  ContentView.swift
//  HabitTracker
//
//  Created by jason on 3/23/24.
//

import SwiftUI

struct Activity: Identifiable, Codable, Hashable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var completions: Int
    
    mutating func incrementCompletions() {
        completions += 1
    }
}

@Observable
class Activities {
    var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedActivites = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decodedActivites
                return
            }
        }
        
        activities = []
    }
}

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.activities) { activity in
                    NavigationLink(activity.name, value: activity)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracker")
            .navigationDestination(for: Activity.self) { activity in
                ActivityView(activities: activities, activity: activity)
            }
            .toolbar {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingSheet) {
                AddView(activities: activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
