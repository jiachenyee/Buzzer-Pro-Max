//
//  Buzzer_Pro_MaxApp.swift
//  Shared
//
//  Created by Jia Chen Yee on 8/3/22.
//

import SwiftUI

@main
struct BuzzerProMaxApp: App {
    
    @StateObject var buzzerManager = BuzzerManager()
    
    var body: some Scene {
        WindowGroup {
            AdminPanelView(buzzerManager: buzzerManager)
        }
        .handlesExternalEvents(matching: [""])
        
        WindowGroup {
            if buzzerManager.leaderboardsHolding {
                Image("Holding")
                    .resizable()
                    .scaledToFill()
            } else {
                LeaderboardView(groupScores: buzzerManager.groupScores)
            }
        }
        .windowStyle(.hiddenTitleBar)
        .handlesExternalEvents(matching: ["leaderboard"])
        
        WindowGroup {
            if buzzerManager.gameHolding {
                Image("Holding")
                    .resizable()
                    .scaledToFill()
            } else {
                GameView()
            }
        }
        .windowStyle(.hiddenTitleBar)
        .handlesExternalEvents(matching: ["game"])
    }
}
