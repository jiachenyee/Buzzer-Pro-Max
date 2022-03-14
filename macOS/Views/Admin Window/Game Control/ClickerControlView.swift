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
    @State var isProModeEnabled = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Collaborative Clicker Conflict")
                .font(.system(size: 36, weight: .bold))
            
            HStack {
                VStack {
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
                            
                            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                                buzzerManager.gameInfo = [
                                    "team1Members": String(team1Members),
                                    "team2Members": String(team2Members),
                                    "team1Score": String(100),
                                    "team2Score": String(100)
                                ]
                                
                                buzzerManager.gameState = .clicker
                            }
                            
                            buzzerManager.send(message: CommandMessage(sendDate: .now,
                                                                       activeDate: .now.addingTimeInterval(2.5),
                                                                       gameState: .clicker,
                                                                       commandInfo: [
                                                                        "team1Members": String(team1Members),
                                                                        "team2Members": String(team2Members)
                                                                       ]))
                            
                            buzzerManager.send(message: CommandMessage(sendDate: .now,
                                                                       activeDate: .now.addingTimeInterval(2.5 + 60),
                                                                       gameState: .holding,
                                                                       commandInfo: [:]))
                        }
                        gameStarted.toggle()
                    } label: {
                        Text(gameStarted ? "End" : "Start")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue.opacity(0.25))
                    }
                    .buttonStyle(.plain)
                    
                    ScrollView(.vertical) {
                        Text("""
- Playing in 2 Teams of 3 groups each, you’ll start with 100 points
- Fight together to click *Harder, Better, Faster, Stronger™* than the other Team
- Teams are randomised, so don’t blame us if you’re on the same side all 3 rounds
- Tap on YJ for 10 points and tap on ZK to for an exclusive -20

Round 1: 300 pts
Winner: 100 pts each
Round 2 & 3: 600 pts/round
Winner: 150 pts each
Loser: 50 pts each

Max Points: 1500
""")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity)
                }
                
                VStack(alignment: .leading) {
                    Text("Points Mode")
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("Pro Mode")
                        .font(.system(size: 16, weight: .bold))
                    Toggle(isOn: $isProModeEnabled) {
                        Text("*Pro Mode* switches the score distribution from **100-0** to **150-50**.")
                            .font(.system(size: 16, weight: .bold))
                    }
                }
            }
        }
        .padding()
    }
}

struct ClickerControlView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerControlView(buzzerManager: BuzzerManager())
    }
}
