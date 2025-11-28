//
//  SingleView.swift
//  DreamApp2
//
//  Created by Filippo Caliendo on 14/10/24.
//

import SwiftUI

struct ProgressCircle: View {
    // Binding variable for progress
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            // Background circle (gray outline)
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.2)
                .foregroundColor(Color.gray)
            
            // Foreground circle with conditional color change
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(self.progress == 1.0 ? Color.green : Color.blue)  // Change to green if completed
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)  // Animate the progress change
            
            // Display percentage and total water
            VStack {
                Text(String(format: "%.0f %%", min(self.progress, 1.0) * 100.0))
                    .font(.largeTitle)
                    .bold()
                
                Text(String(format: "%.2f L", min(self.progress * 2.0, 2.0)))  // Display consumed liters (assuming goal is 2L)
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
        .padding(60)
    }
}

struct SingleView: View {
    @State private var progress = 0.0  // Progress (0.0 to 1.0)
    @State private var totalWaterDrunk = 0.0  // Total water consumed in liters
    private let waterGoal = 2.0  // Daily goal of 2 liters
    
    @State var message: String = " "
    
    var body: some View {
        ZStack {
            //LinearGradient(gradient: Gradient(colors: [Color.teal, Color.blue]), startPoint: .top, endPoint: .bottom)
            //.ignoresSafeArea()
            //.opacity(0.3)
            
            VStack {
                // Progress circle showing how much water has been consumed
                ProgressCircle(progress: $progress)  // Pass the state to ProgressCircle
                
                // Section to add water intake
                VStack {
                    Text(String(format: "Total Water Drunk: %.2f L", totalWaterDrunk))
                        .font(.title)
                        .bold()
                        .foregroundStyle(.blue)
                    //.padding(.bottom)
                    
                    // Use a stepper to add water intake in increments (e.g., 0.25 liters)
                    Stepper(value: $totalWaterDrunk, in: 0...waterGoal, step: 0.25) {
                        Text("Add Water (0.25L per step)")
                            .font(.title2)
                            .padding()
                    }
                    .padding()
                    .onChange(of: totalWaterDrunk) { newValue in
                        // Update progress when water is added
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.progress = newValue / waterGoal
                        }
                    }
                    
                    Button(action: {
                        // Animate progress to 100% when the button is pressed
                        withAnimation(.easeInOut(duration: 2.0)) {
                            self.progress = 1.0  // Set progress to 100%
                        }
                    }) {
                        Text("Complete Progress")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                        //.cornerRadius(10)
                            .clipShape(Capsule())
                    }
                }//vstack
                .padding()
                
            }//zstack
        }//body
    }//struct
}

#Preview {
    SingleView()
}
