//
//  SketchesGuessingView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 15/3/22.
//

import SwiftUI

struct SketchesGuessingView: View {
    
    var group: Group
    var sendDate: Date
    
    @State var userResponse = ""
    @ObservedObject var communicationManager: CommunicationManager
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Challenge 2")
                            .font(.system(size: 36, weight: .bold))
                        
                        Text("Skill-free Sketching Skirmish")
                            .font(.system(size: 64, weight: .bold))
                    }
                    
                    Spacer()
                    
                    FlagView(groupNumber: group.number)
                        .frame(width: 200)
                }
                .padding()
                
                TextField("What's on screen?", text: $userResponse)
                    .font(.system(size: 32))
                    .padding()
                    .background(.white.opacity(0.1))
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .foregroundColor(.white)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: abs(sendDate.timeIntervalSinceNow), repeats: false) { _ in
                communicationManager.send(message: SketchGuessMessage(group: group,
                                                                      sendDate: .now,
                                                                      guess: userResponse))
                
                communicationManager.gameState = .holding
            }
        }
    }
}

struct SketchesGuessingView_Previews: PreviewProvider {
    static var previews: some View {
        SketchesGuessingView(group: Group(number: 1, name: "cold chocolate"),
                             sendDate: Date(),
                             communicationManager: CommunicationManager())
    }
}
