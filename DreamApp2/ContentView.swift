//
//  ContentView.swift
//  DreamApp2
//
//  Created by Filippo Caliendo on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    var activitiesData = ActivitiesViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(activitiesData.activities) { activity in
                    NavigationLink(destination: SingleView()) {
                        ActivityRow(activity: activity)
                    }
                    
                }
                .onDelete(perform: deleteActivity)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }
            .navigationTitle("Daily activities")
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addActivity) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    func deleteActivity(at offsets: IndexSet) {
        activitiesData.remove(at: offsets)
    }
    
    func addActivity() {
        let newActivity = Activity(name: "New Activity", iconName: "star.fill", progress: 0.0)
        activitiesData.addActivity(activity: newActivity)
    }
}

#Preview {
    ContentView()
}
