//
//  BuzzerManager.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 12/3/22.
//

import Foundation
import MultipeerConnectivity

class BuzzerManager: NSObject, ObservableObject {
    
    var session: MCSession?
    var advertiserAssistant: MCNearbyServiceAdvertiser?
    
    var peerID: MCPeerID
    
    var peers: [MCPeerID] = []
    
    override init() {
        let hostName = String(ProcessInfo.processInfo.hostName.dropLast(6))
        peerID = MCPeerID(displayName: String(hostName))
        
        super.init()
    }
}
