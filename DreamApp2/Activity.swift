//
//  Activity.swift
//  DreamApp2
//
//  Created by Filippo Caliendo on 11/10/24.
//

import Foundation
import SwiftUI

struct Activity: Identifiable {
    var id = UUID()
    var name: String
    var iconName: String
    var progress: Double = 0.0
}
