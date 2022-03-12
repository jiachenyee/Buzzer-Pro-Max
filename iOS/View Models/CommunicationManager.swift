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
    
    @Published var gameState: GameState = .trivia
    @Published var commandInfo: [String: String] = ["questionNo": "0"]
    
    @Published var isConnected = false
    
    var session: MCSession?
    
    func send(message: Messagable) {
        #warning("Rui Yang look here")
    }
    
    #warning("Call this method when any Data is received.")
    func receive(data: Data) {
        // Filter for only communications between host Mac and iPad
        guard let command = CommandMessage.from(data: data) else { return }
        
        let secondsUntilActive = abs(command.activeDate.timeIntervalSinceNow)
        
        Timer.scheduledTimer(withTimeInterval: secondsUntilActive,
                             repeats: false) { [self] _ in
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
    
    func join(with group: Group) {
        session = MCSession(peer: MCPeerID(displayName: String(group.number)),
                            securityIdentity: nil, encryptionPreference: .none)
        
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
        browserViewController.dismiss(animated: true) {
            self.isConnected = true
        }
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        session?.disconnect()
        browserViewController.dismiss(animated: true)
    }
}

extension CommunicationManager: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("POTAOT")
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
