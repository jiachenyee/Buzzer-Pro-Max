//
//  TriviaQuestionView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct TriviaQuestionView: View {
    
    var triviaQuestion: TriviaQuestion
    
    var body: some View {
        VStack {
            
        }
    }
}

struct TriviaQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaQuestionView(triviaQuestion: TriviaQuestion(title: "Name one iPhone from every year in chronological order", duration: 30))
    }
}
