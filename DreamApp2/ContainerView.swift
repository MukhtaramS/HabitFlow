//
//  ContainerView.swift
//  DreamApp2
//
//  Created by Filippo Caliendo on 14/10/24.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        TabView{
            Tab("Activities", systemImage: "sparkles"){
                ContentView()
            }
            Tab("Charts", systemImage: "chart.bar.fill"){
                EmptyView()
            }
        }//tabview
    }//body
}//struct

#Preview {
    ContainerView()
}
