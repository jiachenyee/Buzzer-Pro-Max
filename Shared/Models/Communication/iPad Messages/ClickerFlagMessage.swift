//
//  ClickerFlagMessage.swift
//  Buzzer Pro Max
//
//  Created by Jia Chen Yee on 13/3/22.
//

import Foundation

struct ClickerFlagMessage: iPadMessage {
    var sender = Sender.iPad
    
    var team: Int
    
    var group: Group
    
    var points: Int
    
    var sendDate: Date
}
