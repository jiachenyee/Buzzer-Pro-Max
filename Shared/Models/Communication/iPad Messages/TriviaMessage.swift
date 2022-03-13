//
//  TriviaMessage.swift
//  Buzzer Pro Max
//
//  Created by Jia Chen Yee on 9/3/22.
//

import Foundation

struct TriviaBuzzerMessage: iPadMessage {
    var sender = Sender.iPad
    
    var group: Group
    
    var sendDate: Date
}
