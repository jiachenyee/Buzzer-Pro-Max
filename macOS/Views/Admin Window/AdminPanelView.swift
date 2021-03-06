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
    @State var launchedWindows = false
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                if !launchedWindows {
                    if !buzzerManager.isSessionActive {
                        Button {
                            buzzerManager.startHost()
                        } label: {
                            Text("Start")
                        }
                    } else {
                        Button {
                            NSWorkspace.shared.open(URL(string: "buzzerpromax://leaderboard")!)
                            NSWorkspace.shared.open(URL(string: "buzzerpromax://game")!)
                            
                            launchedWindows = true
                        } label: {
                            Text("Launch Windows")
                        }
                    }
                } else {
                    
                    HStack {
                        
                        VStack {
                            GameControlView(buzzerManager: buzzerManager)
                                .frame(maxHeight: .infinity)
                            CentralControlView(buzzerManager: buzzerManager)
                                .frame(height: 400)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("Logs")
                                .font(.system(size: 24, weight: .bold))
                                .padding()
                            TextEditor(text: $buzzerManager.logs)
                                .font(.system(size: 24, weight: .regular, design: .monospaced))
                        }
                        .frame(width: 500)
                    }
                }
            }
        }
        .navigationTitle("Admin")
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
