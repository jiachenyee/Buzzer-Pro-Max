//
//  Team.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import Foundation

struct Team: Identifiable {
    var id = UUID()
    
    var groups: [Group]
    var teamNumber: Int
    
    var score: Double
}
