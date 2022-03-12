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
    
    var session: MCSession?
    var advertiserAssistant: MCNearbyServiceAdvertiser?
    
    var peerID: MCPeerID
    
    var peers: [MCPeerID] = []
    
    let hostName = String(ProcessInfo.processInfo.hostName.dropLast(6))
    
    override init() {
        peerID = MCPeerID(displayName: String(hostName))
        
        super.init()
    }
}
