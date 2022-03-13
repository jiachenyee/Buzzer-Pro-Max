//
//  TriviaManagerView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct TriviaManagerView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        if let questionNo = buzzerManager.gameInfo["questionNo"],
            let questionIndex = Int(questionNo) {
            TriviaQuestionView(triviaQuestion: TriviaQuestion.all[questionIndex])
        } else {
            Image("Holding")
                .resizable()
                .scaledToFill()
        }
    }
}

struct TriviaManagerView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaManagerView(buzzerManager: BuzzerManager())
    }
}
