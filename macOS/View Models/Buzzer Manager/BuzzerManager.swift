//
//  BuzzerManager.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 12/3/22.
//

import Foundation
import MultipeerConnectivity

class BuzzerManager: NSObject, ObservableObject {
    
    @Published var isSessionActive = false
    @Published var groupScores: [GroupScore] = [] {
        didSet {
            let changes = Set(groupScores).symmetricDifference(Set(oldValue)).sorted {
                $0.group.number > $1.group.number
            }.map { groupScore in
                "\(groupScores.contains(groupScore) ? "New" : "Old"): \(groupScore.group.number)-\(groupScore.group.name): \(groupScore.score)"
            }.joined(separator: "\n")
            
            addLog(emoji: "🏅", message: "Updated Scores:\n\(changes)")
        }
    }
    
    @Published var leaderboardsHolding = false {
        didSet {
            addLog(emoji: "👀", message: "Leaderboards holding: \(leaderboardsHolding)")
        }
    }
    @Published var gameHolding = false {
        didSet {
            addLog(emoji: "👀", message: "Game holding: \(leaderboardsHolding)")
        }
    }
    
    @Published var gameState: GameState = .holding {
        didSet {
            addLog(emoji: "👀", message: "Game State: \(gameState)")
        }
    }
    
    @Published var logs = ""
    
    @Published var gameInfo: [String: String] = [:]
    
    var session: MCSession?
    var advertiserAssistant: MCNearbyServiceAdvertiser?
    
    var peerID: MCPeerID
    
    var peers: [MCPeerID] = []
    
    // Get host name, remove ".local"
    let hostName = String(ProcessInfo.processInfo.hostName.dropLast(6))
    
    override init() {
        peerID = MCPeerID(displayName: String(hostName))
        
        super.init()
    }
    
    func addLog(emoji: String, message: String) {
        let date = Date().ISO8601Format(.init(dateSeparator: .dash,
                                              dateTimeSeparator: .standard,
                                              timeSeparator: .colon,
                                              timeZoneSeparator: .colon,
                                              includingFractionalSeconds: true,
                                              timeZone: .current))
        
        logs = "\(emoji) \(date) \(message)\n" + logs
        
        let logURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Downloads/logs.txt")
        
        try? logs.write(to: logURL, atomically: false, encoding: .utf8)
    }
}
