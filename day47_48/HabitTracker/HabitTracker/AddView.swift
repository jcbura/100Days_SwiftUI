//
//  AddView.swift
//  HabitTracker
//
//  Created by jason on 3/23/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var completions = 0
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Activity", text: $name)
                TextField("Descriprion", text: $description, axis: .vertical)
            }
            .navigationTitle("Activity")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let activity = Activity(name: name, description: description, completions: completions)
                        activities.activities.append(activity)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView(activities: Activities())
}
