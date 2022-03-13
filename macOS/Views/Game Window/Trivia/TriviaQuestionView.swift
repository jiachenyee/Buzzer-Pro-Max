//
//  TriviaQuestionView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct TriviaQuestionView: View {
    
    var triviaQuestion: TriviaQuestion
    
    @State var isAnsweringTime = true
    
    var body: some View {
        VStack(alignment: .leading) {
            TimerView(duration: triviaQuestion.duration)
                .frame(height: 30)
                .padding(.vertical, 30)
            
            VStack(alignment: .leading) {
                Text("Challenge 0")
                    .font(.system(size: 24, weight: .semibold))
                
                Text("Tricky Turbo Trivia")
                    .font(.system(size: 36, weight: .bold))
                
                Text(triviaQuestion.title)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 96, weight: .bold))
                
                Spacer()
            }
            .padding(32)
            
            Text(isAnsweringTime ? "Tap on your iPad to buzz in!" : "Time's up! No more buzzing!")
                .font(.system(size: 28, weight: .bold))
                .frame(maxWidth: .infinity)
                .padding(.bottom, 32)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: triviaQuestion.duration, repeats: false) { _ in
                isAnsweringTime = false
            }
        }
    }
}

struct TriviaQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaQuestionView(triviaQuestion: TriviaQuestion(
            title: "Name one iPhone from every year in chronological order",
            duration: 30)
        )
    }
}
