//
//  GameView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        ZStack {
            Color.black
            
            switch buzzerManager.gameState {
            case .holding: BriefingView(buzzerManager: buzzerManager)// briefing
            case .trivia: TriviaManagerView(buzzerManager: buzzerManager)
            case .clicker: ClickerView(buzzerManager: buzzerManager)
            case .sketches: SketchesGameView(buzzerManager: buzzerManager)
            }
        }
        .navigationTitle("Game")
        .edgesIgnoringSafeArea(.all)
        .frame(width: 1920, height: 1080)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(buzzerManager: BuzzerManager())
    }
}
