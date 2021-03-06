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
                DispatchQueue.main.async { [self] in
                    peers.remove(at: index)
                    addLog(emoji: "💔", message: "Disconnected from Group \(peerID.displayName)")
                }
            }
        case .connecting:
            print("Connecting to \(peerID.displayName)")
            DispatchQueue.main.async { [self] in
                addLog(emoji: "🔗", message: "Connecting to Group \(peerID.displayName)")
            }
            
        case .connected:
            if !peers.contains(peerID) {
                DispatchQueue.main.async { [self] in
                    self.peers.insert(peerID, at: 0)
                    
                    if let groupNumber = Int(peerID.displayName),
                        let group = Group.all.first(where: { $0.number == groupNumber }) {
                        
                        self.groupScores.append(GroupScore(group: group, score: 0))
                    }
                    
                    addLog(emoji: "✅", message: "Connected to Group \(peerID.displayName)")
                }
                
                send(message: HelloMessage(sendDate: Date(), hostName: hostName))
            }
        @unknown default:
            print("Unknown state")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        addLog(emoji: "🗣", message: "Received message from Group \(peerID.displayName)")
        
        if let clickerMessage = ClickerFlagMessage.from(data: data) {
            if let score = gameInfo["team\(clickerMessage.team)Score"],
               let intScore = Int(score) {
                DispatchQueue.main.async { [self] in
                    gameInfo["team\(clickerMessage.team)Score"] = String(intScore + clickerMessage.points)
                }
            }
        } else if let sketchMessage = SketchMessage.from(data: data) {
            let sketch = sketchMessage.sketch
            
            let image = sketch.image(from: sketch.bounds, scale: 2)
                .cgImage(forProposedRect: nil, context: nil, hints: nil)
            
            let pngData = NSBitmapImageRep(cgImage: image!).representation(using: .png, properties: [:])
            
            let imageURL = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Downloads/Drawings/\(sketchMessage.group.number)-\(UUID().uuidString).png")
            
            try? pngData?.write(to: imageURL)
            
            var submissions = (gameInfo["drawingSubmissions"] ?? "").split(separator: "\n")
                .map { String($0) }
                .filter { !$0.isEmpty }
            
            submissions.append(imageURL.path)
            
            gameInfo["drawingSubmissions"] = submissions.joined(separator: "\n")
            
        } else if let sketchGuessMessage = SketchGuessMessage.from(data: data) {
            gameInfo["sketchGuess"]?.append("\(sketchGuessMessage.group.number)\t\(sketchGuessMessage.guess)\n")
            
            print(sketchGuessMessage.group.number, sketchGuessMessage.guess)
            addLog(emoji: "🫠", message: "\(sketchGuessMessage.group.number)-\(sketchGuessMessage.guess)")
        } else if let triviaBuzzerMessage = TriviaBuzzerMessage.from(data: data) {
            print(triviaBuzzerMessage.group)
            if gameInfo["triviaResponses"] != nil {
                gameInfo["triviaResponses"]?.append("\(triviaBuzzerMessage.group.number) - \(triviaBuzzerMessage.group.name)\n")
            }
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
