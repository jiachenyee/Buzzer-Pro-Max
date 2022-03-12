//
//  HelloMessage.swift
//  Buzzer Pro Max (Shared)
//
//  Created by Jia Chen Yee on 12/3/22.
//

import Foundation

/// `HelloMessage` is sent from the host to any device.
struct HelloMessage: Messagable {
    var sender: Sender = .mac
    
    var sendDate: Date
    
    var hostName: String
}
