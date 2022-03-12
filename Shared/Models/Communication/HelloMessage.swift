//
//  HelloMessage.swift
//  Buzzer Pro Max (Shared)
//
//  Created by Jia Chen Yee on 12/3/22.
//

import Foundation

struct HelloMessage: iPadMessage {
    var group: Group
    
    var sender: Sender
    
    var sendDate: Date
    
    var messageID = UUID()
}
