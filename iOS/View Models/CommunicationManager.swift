//
//  CommunicationManager.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 9/3/22.
//

import Foundation
import SwiftUI
import MultipeerConnectivity

class CommunicationManager: NSObject, ObservableObject {
    
    @Published var gameState: GameState = .holding
    @Published var commandInfo: [String: String] = [:]
    
    @Published var isConnected = false
    
    var session: MCSession?
    
    var hostPeerID: MCPeerID?
    var peerID: MCPeerID?
    
    func send(message: Messagable) {
        if let session = session,
           let data = message.toJSONData(),
           let hostPeerID = hostPeerID {
            try? session.send(data, toPeers: [hostPeerID], with: .reliable)
        }
    }
    
    func receive(data: Data) {
        // Filter for only communications between host Mac and iPad
        guard let command = CommandMessage.from(data: data) else { return }
        
        let activeTime = command.activeDate.timeIntervalSinceNow
        let secondsUntilActive = activeTime > 0 ? activeTime : 0
        
        let action = { [self] in
            DispatchQueue.main.async {
                // Check if both are equal, if not, update it.
                // This if prevents an unnecessary view refresh as, if gameState is set to the same value as before,
                //   it will still necessitate a view refresh. Oh no run-on sentence.
                if gameState != command.gameState {
                    gameState = command.gameState
                }
                
                if commandInfo != command.commandInfo {
                    commandInfo = command.commandInfo
                }
            }
        }
        
        if secondsUntilActive <= 0.5 {
            action()
        } else {
            DispatchQueue.global(qos: .default)
                .asyncAfter(deadline: .now()
                                .advanced(by: .milliseconds(Int(secondsUntilActive * 1000))),
                            execute: {
                action()
            })
        }
    }
    
    func join(with group: Group) {
        peerID = MCPeerID(displayName: String(group.number))
        session = MCSession(peer: peerID!,
                            securityIdentity: nil,
                            encryptionPreference: .none)
        
        session?.delegate = self
        
        guard let window = UIApplication.shared.keyWindow,
                let session = session else { return }
        
        let mcBrowserViewController = MCBrowserViewController(serviceType: MCConstants.service, session: session)
        
        mcBrowserViewController.delegate = self
        
        window.rootViewController?.present(mcBrowserViewController, animated: true)
    }
}

extension CommunicationManager: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
//        session?.disconnect()
        browserViewController.dismiss(animated: true)
    }
}

extension CommunicationManager: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let hello = HelloMessage.from(data: data) {
            if let host = session.connectedPeers.first(where: { $0.displayName == hello.hostName }) {
                hostPeerID = host
                DispatchQueue.main.async {
                    self.isConnected = true
                }
            }
        } else {
            receive(data: data)
        }
    }
    
    // MARK: - Unused Required Functions
    func session(_ session: MCSession,
                 didReceive stream: InputStream,
                 withName streamName: String,
                 fromPeer peerID: MCPeerID) {
    }
    
    func session(_ session: MCSession,
                 didStartReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 with progress: Progress) {
    }
    
    func session(_ session: MCSession,
                 didFinishReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 at localURL: URL?,
                 withError error: Error?) {
    }
}
