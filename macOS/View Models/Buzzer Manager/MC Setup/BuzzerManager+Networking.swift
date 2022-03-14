//
//  BuzzerManager+Networking.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 12/3/22.
//

import Foundation
import MultipeerConnectivity

extension BuzzerManager {
    func send(message: Messagable) {
        if let session = session,
           let data = message.toJSONData() {
            do {
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
                addLog(emoji: "💬", message: "Sent \(data) to everyone")
            } catch {
                addLog(emoji: "🔥", message: "Failed to send: \(error.localizedDescription)")
            }
        }
    }
    
    func startHost() {
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)
        
        session?.delegate = self
        
        advertiserAssistant = MCNearbyServiceAdvertiser(peer: peerID,
                                                        discoveryInfo: nil,
                                                        serviceType: MCConstants.service)
        
        advertiserAssistant?.delegate = self
        
        advertiserAssistant?.startAdvertisingPeer()
        
        isSessionActive = true
    }
}
