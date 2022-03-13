//
//  FlagRaisingView.swift
//  Buzzer Pro Max
//
//  Created by Jia Chen Yee on 13/3/22.
//

import SwiftUI

struct FlagRaisingView: View {
    var group: Group
    
    @ObservedObject var communicationManager: CommunicationManager
    
    var body: some View {
        ZStack {
            Color("Team\(communicationManager.commandInfo["team"] ?? "1")")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Challenge 2")
                            .font(.system(size: 36, weight: .bold))
                        
                        Text("Forever\nFluttering\nFlag")
                            .font(.system(size: 64, weight: .bold))
                    }
                    
                    Spacer()
                    
                    FlagView(groupNumber: group.number)
                        .frame(width: 200)
                }
                .padding()
                
                Spacer()
                
                Text("Tap anywhere on screen to ensure your flag doesn’t touch the lines")
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

struct FlagRaisingView_Previews: PreviewProvider {
    static var previews: some View {
        FlagRaisingView(group: Group(number: 1, name: "Potato"), communicationManager: .init())
.previewInterfaceOrientation(.landscapeLeft)
    }
}
