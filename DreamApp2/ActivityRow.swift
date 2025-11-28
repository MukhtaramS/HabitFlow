//
//  ActivityRow.swift
//  DreamApp2
//
//  Created by Filippo Caliendo on 11/10/24.
//

import SwiftUI

struct ActivityRow: View {
    var activity: Activity

    var body: some View {
        ZStack {
            Color.clear
            VStack {
                Spacer()
                HStack {
                    Image(systemName: activity.iconName)
                        .font(.title2)
                        .foregroundColor(.black)
                    Text(activity.name)
                        .font(.headline)
                   Spacer()

                }
                .padding(.horizontal)
               //HStack { //arrow
                  //Spacer()
                    //Image(systemName: "chevron.right")
                     //   .foregroundColor(.gray)
                      //  .padding(.trailing)
                //}
            }
            .padding(.vertical)
            //.background(Color(UIColor.systemGray6))
            .cornerRadius(20)

            // Large percentage text
            Text("\(Int(activity.progress * 100))%")
                .font(.system(size: 80, weight: .heavy))
                .fontWidth(.condensed)                .foregroundColor(Color.blue.opacity(0.05))
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .overlay(
            ProgressView(value: activity.progress)
                .tint(.blue)
                .frame(height: 6)
                .padding(.horizontal),
            alignment: .bottom
        )
        .frame(height: 100)
        .padding(.horizontal, 5.0)
    }
}

#Preview {
    ActivityRow(activity: Activity(name: "Running", iconName: "figure.run", progress: 0.65))
}
