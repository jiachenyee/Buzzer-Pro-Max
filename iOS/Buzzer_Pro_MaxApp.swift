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
    
    @State private var group: Group?
    
    var body: some Scene {
        WindowGroup {
            if let group = group {
                GameManagerView(group: group, communicationManager: communicationManager)
                    .statusBar(hidden: true)
            } else {
                SetupView(group: $group)
            }
        }
    }
}
