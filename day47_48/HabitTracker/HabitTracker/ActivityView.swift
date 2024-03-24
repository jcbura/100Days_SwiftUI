//
//  ActivityView.swift
//  HabitTracker
//
//  Created by jason on 3/23/24.
//

import SwiftUI

struct ActivityView: View {
    var activities: Activities
    var activity: Activity
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(activity.name)
                        .font(.headline)
                    
                    Text(activity.description)
                        .font(.subheadline)
                }
                
                Spacer()
                
                Text("\(activity.completions)")
            }
            .padding(.horizontal)
        }
        
        Button { // doesn't really work as intended
            let number = activities.activities.firstIndex(of: activity) ?? -1
            if number != -1 {
                let newActivity = Activity(name: activity.name, description: activity.description, completions: activity.completions + 1)
                activities.activities[number] = newActivity
            }
        } label: {
            Text("Completed Habit")
            Image(systemName: "plus")
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    ActivityView(activities: Activities(), activity: Activity(name: "Example", description: "This is an example description", completions: 0))
}
