//
//  AdminPanelView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 8/3/22.
//

import SwiftUI

struct AdminPanelView: View {
    var body: some View {
        ZStack {
            Color.black
            Text("Admin Panel")
        }
        .onAppear {
            NSWorkspace.shared.open(URL(string: "buzzerpromax://leaderboard")!)
            NSWorkspace.shared.open(URL(string: "buzzerpromax://game")!)
        }
    }
}

struct AdminPanelView_Previews: PreviewProvider {
    static var previews: some View {
        AdminPanelView()
    }
}
