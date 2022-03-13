//
//  CentralControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct CentralControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Holding")
                    .font(.system(size: 24, weight: .regular))
                
                Button {
                    buzzerManager.send(message: CommandMessage(sendDate: Date(),
                                                               activeDate: Date(),
                                                               gameState: .holding,
                                                               commandInfo: [:]))
                } label: {
                    Text("iPad devices")
                        .font(.system(size: 24, weight: .regular))
                }
                
                Button {
                    #warning("TO IMPLEMENT")
                } label: {
                    Text("Game Screen")
                        .font(.system(size: 24, weight: .regular))
                }
                
                Button {
                    #warning("TO IMPLEMENT")
                } label: {
                    Text("Leaderboards Screen")
                        .font(.system(size: 24, weight: .regular))
                }
            }
            .frame(maxWidth: .infinity)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Game Mode")
                    .font(.system(size: 24, weight: .regular))
                
                Button {
                    #warning("Incomplete implementation")
                } label: {
                    Text("Briefing")
                        .font(.system(size: 24, weight: .regular))
                }
                
                Button {
                    #warning("Incomplete implementation")
                } label: {
                    Text("Trivia")
                        .font(.system(size: 24, weight: .regular))
                }
                
                Button {
                    #warning("Incomplete implementation")
                } label: {
                    Text("Clicker")
                        .font(.system(size: 24, weight: .regular))
                }
                
                Button {
                    #warning("Incomplete implementation")
                } label: {
                    Text("Scribbling")
                        .font(.system(size: 24, weight: .regular))
                }
            }
            .frame(maxWidth: .infinity)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Points")
                    .font(.system(size: 24, weight: .regular))
                
                List($buzzerManager.groupScores, id: \.group.id) { $groupScore in
                    CentralControlPointsView(groupScore: $groupScore)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct CentralControlView_Previews: PreviewProvider {
    static var previews: some View {
        CentralControlView(buzzerManager: BuzzerManager())
    }
}
