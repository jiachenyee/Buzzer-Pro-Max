//
//  TriviaControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct TriviaControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    @State var currentQuestion = 0
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
                Text("1 - \(TriviaQuestion.all[currentQuestion].title)")
                    .font(.system(size: 24, weight: .bold))
                    .frame(height: 100, alignment: .top)
                
                Button {
                    if currentQuestion < 9 {
                        currentQuestion += 1
                    } else {
                        isNextQuestionButtonDisabled = true
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
                    Text("Answer:\n\(TriviaQuestion.all[currentQuestion].answer)")
                        .font(.system(size: 16))
                }
                
//                List(TriviaQuestion.all, id: \.title) { triviaQuestion in
//                    Text("\(triviaQuestion.title) - Answer: \(triviaQuestion.answer)")
//                }
//                    .frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
            .padding()
            VStack(alignment: .leading) {
                Text("Responses")
                    .font(.system(size: 24, weight: .bold))
                    .frame(height: 60, alignment: .top)
                    .padding()
                List(TriviaQuestion.all, id: \.title) { triviaQuestion in
                    Text("\(triviaQuestion.title) - Answer: \(triviaQuestion.answer)")
                }
                    .frame(maxWidth: .infinity)
                
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
