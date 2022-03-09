//
//  Group.swift
//  Buzzer Pro Max (Shared)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import Foundation

struct Group: Identifiable, Hashable, Codable {
    
    var id: Int { number }
    
    var number: Int
    var name: String
}
