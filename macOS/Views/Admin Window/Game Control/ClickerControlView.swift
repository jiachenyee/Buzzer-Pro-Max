//
//  ClickerControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct ClickerControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    @State var gameStarted = false
    
    var body: some View {
        Button {
            if gameStarted {
                buzzerManager.gameInfo = [:]
            } else {
                let groups = buzzerManager.groupScores.shuffled().map { $0.group }
                
                let team1Members = groups.prefix(3).reduce("") {
                    "\($0),\($1.number)"
                }.dropFirst()
                
                let team2Members = groups.suffix(3).reduce("") {
                    "\($0),\($1.number)"
                }.dropFirst()
                
                buzzerManager.gameInfo = [
                    "team1Members": String(team1Members),
                    "team2Members": String(team2Members),
                    "team1Score": String(100),
                    "team2Score": String(100)
                ]
                
                buzzerManager.gameState = .clicker
                
                buzzerManager.send(message: CommandMessage(sendDate: .now,
                                                           activeDate: .now.addingTimeInterval(2.5),
                                                           gameState: .clicker,
                                                           commandInfo: [
                                                            "team1Members": String(team1Members),
                                                            "team2Members": String(team2Members)
                                                           ]))
            }
            gameStarted.toggle()
        } label: {
            Text(gameStarted ? "End" : "Start")
        }
    }
}

struct ClickerControlView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerControlView(buzzerManager: BuzzerManager())
    }
}
