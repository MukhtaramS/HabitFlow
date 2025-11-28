//
//  ActivityViewModel.swift
//  DreamApp2
//
//  Created by Filippo Caliendo on 11/10/24.
//

import Foundation

class ActivitiesViewModel: ObservableObject {
    @Published var activities: [Activity] = [
        Activity(name: "Running", iconName: "figure.run"),
        Activity(name: "Drinking water", iconName: "drop.fill"),
        Activity(name: "Reading", iconName: "book.fill"),
        Activity(name: "Playing sports", iconName: "figure.volleyball"),
        Activity(name: "Studying", iconName: "pencil.line")
    ]
    
    func remove(at offsets: IndexSet){
        activities.remove(atOffsets: offsets)
    }
    
    func addActivity(activity: Activity){
        activities.append(activity)
    }
}
