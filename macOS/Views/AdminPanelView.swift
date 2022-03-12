//
//  AdminPanelView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 8/3/22.
//

import SwiftUI

struct AdminPanelView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    @State var loaded = false
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Text("Admin Panel")
                Button {
                    buzzerManager.startHost()
                } label: {
                    Text("Start")
                }
                Button {
                    NSWorkspace.shared.open(URL(string: "buzzerpromax://leaderboard")!)
                    NSWorkspace.shared.open(URL(string: "buzzerpromax://game")!)
                } label: {
                    Text("Launch Windows")
                }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                let windows = NSApplication.shared.windows
                for window in windows where window.titleVisibility == .hidden {
                    window.close()
                }
            }
        }
    }
}

struct AdminPanelView_Previews: PreviewProvider {
    static var previews: some View {
        AdminPanelView(buzzerManager: BuzzerManager())
    }
}
