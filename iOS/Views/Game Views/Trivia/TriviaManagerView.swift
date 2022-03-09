//
//  TriviaManagerView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import SwiftUI

struct TriviaManagerView: View {
    
    var group: Group
    
    @ObservedObject var communicationManager: CommunicationManager
    
    var body: some View {
        if let stringQuestionIndex = communicationManager.commandInfo["questionNo"],
            let questionIndex = Int(stringQuestionIndex) {
            
            TriviaView(group: group,
                       communicationManager: communicationManager,
                       question: TriviaQuestion.all[questionIndex])
        }
    }
}

struct TriviaManagerView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaManagerView(group: Group(number: 1, name: "cold chocolate"), communicationManager: CommunicationManager())
    }
}
