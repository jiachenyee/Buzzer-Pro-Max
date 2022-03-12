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
            LeaderboardView(groupScores: buzzerManager.groupScores)
        }
        .windowStyle(.hiddenTitleBar)
        .handlesExternalEvents(matching: ["leaderboard"])
        
        WindowGroup {
            GameView()
        }
        .windowStyle(.hiddenTitleBar)
        .handlesExternalEvents(matching: ["game"])
    }
}
