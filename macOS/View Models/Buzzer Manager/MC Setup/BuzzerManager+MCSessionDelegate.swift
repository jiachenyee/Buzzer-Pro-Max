//
//  BuzzerManager+MCSessionDelegate.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 12/3/22.
//

import Foundation
import MultipeerConnectivity

extension BuzzerManager: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .notConnected:
            if let index = peers.firstIndex(of: peerID) {
                DispatchQueue.main.async {
                    self.peers.remove(at: index)
                }
            }
            
        case .connecting:
            print("Connecting to \(peerID.displayName)")
            
        case .connected:
            if !peers.contains(peerID) {
                DispatchQueue.main.async {
                    self.peers.insert(peerID, at: 0)
                    
                    if let groupNumber = Int(peerID.displayName),
                        let group = Group.all.first(where: { $0.number == groupNumber }) {
                        
                        self.groupScores.append(GroupScore(group: group, score: 0))
                    }
                }
                
                send(message: HelloMessage(sendDate: Date(), hostName: hostName))
            }
            
        @unknown default:
            print("Unknown state")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let triviaBuzzerMessage = TriviaBuzzerMessage.from(data: data) {
            print(triviaBuzzerMessage.group)
        }
    }
    
    // MARK: - Unused Required Functions
    func session(_ session: MCSession,
                 didReceive stream: InputStream,
                 withName streamName: String,
                 fromPeer peerID: MCPeerID) {}
    
    func session(_ session: MCSession,
                 didStartReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 with progress: Progress) {}
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName
                 resourceName: String,
                 fromPeer peerID: MCPeerID,
                 at localURL: URL?,
                 withError error: Error?) {}
}
