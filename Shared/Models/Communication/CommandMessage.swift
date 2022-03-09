//
//  CommandMessage.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import Foundation

struct CommandMessage: Messagable {
    var sender: Sender = .mac
    var sendDate: Date
    
    /// Date when command is active
    var activeDate: Date
    
    /// Game state to set to
    var gameState: GameState
    
    var commandInfo: [String: String]
}
