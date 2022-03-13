//
//  ClickerView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 13/3/22.
//

import SwiftUI

struct ClickerView: View {
    
    var group: Group
    
    @ObservedObject var communicationManager: CommunicationManager
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color("Team\(communicationManager.commandInfo["team"] ?? "1")")
                Text("Tap anywhere on screen, as fast as you can!")
                    .font(.system(size: 36, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.black)
            }
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Challenge 1")
                            .font(.system(size: 36, weight: .bold))
                        
                        Text("Collaborative\nClicker\nConflict")
                            .font(.system(size: 64, weight: .bold))
                    }
                    
                    Spacer()
                    
                    FlagView(groupNumber: group.number)
                        .frame(width: 200)
                }
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
        }
        .onTapGesture {
            communicationManager.send(message: ClickerMessage(team: Int(communicationManager.commandInfo["team"]!)!,
                                                              group: group,
                                                              points: 1,
                                                              sendDate: .now))
        }
    }
}

struct ClickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView(group: Group(number: 1, name: "potato"),
                    communicationManager: CommunicationManager())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
