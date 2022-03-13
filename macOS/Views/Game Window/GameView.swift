//
//  GameView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            Color.black
            TriviaQuestionView(triviaQuestion: TriviaQuestion(
                title: "Name one iPhone from every year in chronological order",
                duration: 30))
        }
        .navigationTitle("Game")
        .edgesIgnoringSafeArea(.all)
        .frame(width: 1920, height: 1080)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
