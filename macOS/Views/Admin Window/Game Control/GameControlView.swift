//
//  GameControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct GameControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        switch buzzerManager.gameState {
        case .holding: EmptyView() // Briefing
        case .trivia: TriviaControlView(buzzerManager: buzzerManager)
        case .clicker: ClickerControlView(buzzerManager: buzzerManager)
        case .sketches: EmptyView()
        }
    }
}

struct GameControlView_Previews: PreviewProvider {
    static var previews: some View {
        GameControlView(buzzerManager: BuzzerManager())
    }
}
