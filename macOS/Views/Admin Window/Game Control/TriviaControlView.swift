//
//  TriviaControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct TriviaControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    @State var hasGameStarted = false
    @State var isNextQuestionButtonDisabled = false
    @State var isReopenButtonDisabled = true
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Tricky Turbo Trivia")
                    .font(.system(size: 36, weight: .heavy))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if !hasGameStarted {
                    Button {
                        buzzerManager.gameInfo["questionNo"] = nil
                        buzzerManager.gameInfo["triviaResponses"] = ""
                        buzzerManager.send(message: CommandMessage(sendDate: .now,
                                                                   activeDate: .now.addingTimeInterval(2.5),
                                                                   gameState: .trivia,
                                                                   commandInfo: ["questionNo": "0"]))
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                            hasGameStarted = true
                            buzzerManager.gameInfo["questionNo"] = "0"
                        }
                    } label: {
                        Text("Start Game")
                    }
                } else {
                    Text("\(Int(buzzerManager.gameInfo["questionNo"]!)!+1) - \(TriviaQuestion.all[Int(buzzerManager.gameInfo["questionNo"]!)!].title)")
                        .font(.system(size: 24, weight: .bold))
                        .frame(height: 100, alignment: .top)
                    
                    Button {
                        if let question = Int(buzzerManager.gameInfo["questionNo"]!) {
                            
                            if question < 9 {
                                buzzerManager.gameInfo["triviaResponses"] = ""
                                buzzerManager.send(message: CommandMessage(sendDate: .now, activeDate: .now.addingTimeInterval(2.5), gameState: .trivia, commandInfo: ["questionNo": "\(question+1)"]))
                                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                                    buzzerManager.gameInfo["questionNo"] = "\(question+1)"
                                }
                            } else {
                                isNextQuestionButtonDisabled = true
                            }
                            
                        }
                    } label: {
                        Text("Next Question")
                    }.disabled(isNextQuestionButtonDisabled)
                    Button {
                        #warning("need to implement")
                    } label: {
                        Text("Reopen for answering")
                    }.disabled(isReopenButtonDisabled)
                    ScrollView {
                        Text("Answer:\n\(TriviaQuestion.all[Int(buzzerManager.gameInfo["questionNo"]!)!].answer)")
                            .font(.system(size: 16))
                    }
                }
            }.frame(maxWidth: .infinity)
                .padding()
            VStack(alignment: .leading) {
                Text("Responses")
                    .font(.system(size: 24, weight: .bold))
                    .frame(height: 60, alignment: .top)
                    .padding()
                if let buzzedIn = buzzerManager.gameInfo["triviaResponses"]?.split(separator: "\n") {
                    List(buzzedIn, id: \.self) { groupBuzzed in
                        HStack {
                            Text(groupBuzzed)
                                .font(.system(size: 16))
                            Button {
                                print("Full")
                            } label: {
                                Text("Full")
                                    .font(.system(size: 16))
                            }
                            Button {
                                print("Half")
                            } label: {
                                Text("Half")
                                    .font(.system(size: 16))
                            }
                        }
                    }.frame(maxWidth: .infinity)
                }
                
            }.frame(width: 500)
                .padding()
        }.frame(maxWidth: .infinity)
    }
}

struct TriviaControlView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaControlView(buzzerManager: BuzzerManager())
    }
}
