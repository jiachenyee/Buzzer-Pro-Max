//
//  SketchGuessMessage.swift
//  Buzzer Pro Max
//
//  Created by Jia Chen Yee on 14/3/22.
//

import Foundation

struct SketchGuessMessage: iPadMessage {
    var sender: Sender = .iPad
    
    var group: Group
    
    var sendDate: Date
    
    var guess: String
}
