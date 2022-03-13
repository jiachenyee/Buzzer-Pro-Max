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
        case .flag:
            FlagRaisingView(group: group, communicationManager: communicationManager)
        case .sketches:
            PictionaryView(group: group, communicationManager: communicationManager)
        }
    }
}

struct GameManagerView_Previews: PreviewProvider {
    static var previews: some View {
        GameManagerView(group: Group(number: 1, name: "cold chocolate"), communicationManager: CommunicationManager())
    }
}
