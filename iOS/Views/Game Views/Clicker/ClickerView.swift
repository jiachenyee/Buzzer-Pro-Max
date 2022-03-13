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
            let team = Int(communicationManager.commandInfo["team"]!)!
            
            Color("Team\(team)")
                .edgesIgnoringSafeArea(.all)
            
            BouncyYJView {
                communicationManager.send(message: ClickerFlagMessage(team: team,
                                                                  group: group,
                                                                  points: 20,
                                                                  sendDate: .now))
            } tappedOnZK: {
                communicationManager.send(message: ClickerFlagMessage(team: team,
                                                                  group: group,
                                                                  points: -20,
                                                                  sendDate: .now))
            }
            
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
                .padding()
                
                Spacer()
                
                Text("Tap anywhere on screen, as fast as you can!")
                    .font(.system(size: 36, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
            }
            .edgesIgnoringSafeArea(.bottom)
            .foregroundColor(.white)
        }
        .onTapGesture {
            communicationManager.send(message: ClickerFlagMessage(team: Int(communicationManager.commandInfo["team"]!)!,
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
