//
//  LeaderboardView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack {
            Color.black
            Text("Leaderboard")
        }
        .navigationTitle("Leaderboard")
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
