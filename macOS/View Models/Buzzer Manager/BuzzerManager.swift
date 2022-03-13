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
    @Published var groupScores: [GroupScore] = []
    
    @Published var logs = ""
    
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
    }
}
