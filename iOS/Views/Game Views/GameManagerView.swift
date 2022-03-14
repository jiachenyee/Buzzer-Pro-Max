//
//  GameManagerView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import SwiftUI

struct GameManagerView: View {
    
    var group: Group
    
    @ObservedObject var communicationManager: CommunicationManager
    
    var body: some View {
        switch communicationManager.gameState {
        case .holding:
            HoldingView(group: group)
        case .trivia:
            TriviaManagerView(group: group, communicationManager: communicationManager)
        case .clicker:
            ClickerView(group: group, communicationManager: communicationManager)
        case .sketches:
            if let guessGroup = communicationManager.commandInfo["drawGroup"],
               let sendDate = communicationManager.commandInfo["sendDate"] {
                
                if guessGroup == String(group.number) {
                    SketchesItsYours(group: group)
                } else {
                    SketchesGuessingView(group: group,
                                         sendDate: Date(timeIntervalSince1970: Double(sendDate) ?? 0),
                                         communicationManager: communicationManager)
                }
            } else {
                PictionaryView(group: group, communicationManager: communicationManager)
            }
        }
    }
}

struct GameManagerView_Previews: PreviewProvider {
    static var previews: some View {
        GameManagerView(group: Group(number: 1, name: "cold chocolate"), communicationManager: CommunicationManager())
    }
}
