//
//  CommunicationManager.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 9/3/22.
//

import Foundation
import SwiftUI
import MultipeerConnectivity

class CommunicationManager: ObservableObject {
    
    @Published var gameState: GameState = .trivia
    @Published var commandInfo: [String: String] = ["questionNo": "0"]
    
    func send(message: Messagable) {
        #warning("Rui Yang look here")
    }
    
    #warning("Call this method when any Data is received.")
    func receive(data: Data) {
        // Filter for only communications between host Mac and iPad
        guard let command = CommandMessage.from(data: data) else { return }
        
        let secondsUntilActive = abs(command.activeDate.timeIntervalSinceNow)
        
        Timer.scheduledTimer(withTimeInterval: secondsUntilActive,
                             repeats: false) { [self] _ in
            // Check if both are equal, if not, update it.
            // This if prevents an unnecessary view refresh as, if gameState is set to the same value as before,
            //   it will still necessitate a view refresh. Oh no run-on sentence.
            if gameState != command.gameState {
                gameState = command.gameState
            }
            
            if commandInfo != command.commandInfo {
                commandInfo = command.commandInfo
            }
        }
    }
}
