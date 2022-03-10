//
//  TriviaView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 8/3/22.
//

import SwiftUI

struct TriviaView: View {
    
    var group: Group
    
    @ObservedObject var communicationManager: CommunicationManager
    
    var question: TriviaQuestion
    
    @State private var respondedToQuestion = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Challenge 0")
                            .font(.system(size: 36, weight: .bold))
                        
                        Text("Tricky Turbo Trivia")
                            .font(.system(size: 64, weight: .bold))
                    }
                    
                    Spacer()
                    
                    FlagView(groupNumber: 1)
                        .frame(width: 200)
                }
                
                Spacer()
                
                if respondedToQuestion {
                    Text("🐝 Buzzed!")
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 90, weight: .bold))
                    
                    Spacer()
                    
                    Text("Wait for your team to be called up!")
                        .font(.system(size: 36, weight: .regular))
                } else {
                    Text(question.title)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 90, weight: .bold))
                    
                    Spacer()
                    
                    Text("Tap anywhere on the screen to buzz in!")
                        .font(.system(size: 36, weight: .regular))
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        .onTapGesture {
            if !respondedToQuestion {
                communicationManager.send(message: TriviaBuzzerMessage(group: group, sendDate: .now))
                withAnimation {
                    respondedToQuestion = true
                }
            }
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView(group: Group(number: 1, name: "cold chocolate"),
                   communicationManager: CommunicationManager(), question:
                    TriviaQuestion(title: "Name one iPhone from every year in chronological order", duration: 10))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
