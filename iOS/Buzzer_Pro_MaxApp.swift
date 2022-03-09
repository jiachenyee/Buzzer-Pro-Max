//
//  Buzzer_Pro_MaxApp.swift
//  Shared
//
//  Created by Jia Chen Yee on 8/3/22.
//

import SwiftUI

@main
struct BuzzerProMaxApp: App {
    
    @StateObject var communicationManager = CommunicationManager()
    
    var groupNumber = 0
    
    var body: some Scene {
        WindowGroup {
            TriviaView(communicationManager: communicationManager,
                       question: TriviaQuestion(title: "Potato Potato Potaot",
                                                duration: 10))
                .statusBar(hidden: true)
        }
    }
}
