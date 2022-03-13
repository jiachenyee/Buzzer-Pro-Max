//
//  LeaderboardView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import SwiftUI
import Foundation

struct LeaderboardView: View {
    
    var groupScores: [GroupScore]
    
    var body: some View {
            
        ZStack {
            Color.black
            HStack(spacing: 0) {
                ForEach(groupScores, id: \.group.number) { groupScore in
                    VStack(alignment: .leading) {
                        Text("\(groupScore.group.number)-\(groupScore.group.name)")
                            .font(.system(size: 24, weight: .bold))
                        
                        HStack(alignment: .bottom, spacing: 0) {
                            Rectangle()
                                .frame(width: 20, height: 900)
                            
                            FlagView(groupNumber: groupScore.group.number)
                                .frame(width: 250)
                                .offset(y: -groupScore.score / 2.5)
                        }
                        
                        Text("\(Int(groupScore.score.rounded()))")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 42, weight: .bold))
                            .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.trailing)
            }
            .padding(.horizontal)
        }
        .frame(width: 1920, height: 1080)
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Leaderboard")
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(groupScores: [])
    }
}
