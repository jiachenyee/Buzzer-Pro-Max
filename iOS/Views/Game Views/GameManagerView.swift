//
//  GameManagerView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import SwiftUI

struct GameManagerView: View {
    
    var group: Group
    
    @State private var gameState: GameState = .holding
    
    @ObservedObject var communicationManager: CommunicationManager
    
    var body: some View {
        switch gameState {
        case .holding:
            ContentView()
        case .trivia:
            TriviaView(communicationManager: communicationManager,
                       question: TriviaQuestion(title: "Potato Potato Potaot",
                                                duration: 10))
        case .clicker:
            EmptyView()
        case .flag:
            EmptyView()
        case .sketches:
            EmptyView()
        }
    }
}

struct GameManagerView_Previews: PreviewProvider {
    static var previews: some View {
        GameManagerView(group: Group(number: 1, name: "cold chocolate"), communicationManager: CommunicationManager())
    }
}
