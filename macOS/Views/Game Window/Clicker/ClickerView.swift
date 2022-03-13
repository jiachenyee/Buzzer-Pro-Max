//
//  ClickerView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct ClickerView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        
        let blueTeam = Team(groups: [
            Group(number: 1, name: "cold choc"),
            Group(number: 2, name: "swift at swift"),
            Group(number: 3, name: "swifters")
        ], teamNumber: 1, score: 100)
        
        let redTeam = Team(groups: [
            Group(number: 4, name: "pineapple"),
            Group(number: 5, name: "mccakes"),
            Group(number: 6, name: "good morning")
        ], teamNumber: 2, score: 100)
        
        VStack(alignment: .leading) {
            TimerView(duration: 60)
                .frame(height: 30)
                .padding(.vertical, 30)
            
            VStack(alignment: .leading) {
                Text("Challenge 1")
                    .font(.system(size: 24, weight: .semibold))
                
                Text("Collaborative Clicker Conflict")
                    .font(.system(size: 36, weight: .bold))
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 32) {
                        ForEach(blueTeam.groups, id: \.number) { group in
                            Text("\(group.number)-\(group.name)")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 24, weight: .bold))
                    
                    Text("vs")
                        .font(.system(size: 72, weight: .bold))
                    
                    VStack(alignment: .trailing, spacing: 32) {
                        ForEach(redTeam.groups, id: \.number) { group in
                            Text("\(group.number)-\(group.name)")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 24, weight: .bold))
                }
                .padding(.top)
                
                HStack {
                    Text("\(Int(round(blueTeam.score)))")
                    Spacer()
                    Text("\(Int(round(redTeam.score)))")
                }
                .font(.system(size: 36, weight: .bold))
                .padding(.top, 64)
                
                ZStack {
                    Rectangle()
                        .fill(Color("Team1"))
                    
                    let effectiveRedScore = redTeam.score <= 0 ? 0.1 : redTeam.score
                    let effectiveBlueScore = blueTeam.score <= 0 ? 0.1 : blueTeam.score
                    
                    Rectangle()
                        .fill(Color("Team2"))
                        .scaleEffect(x: effectiveRedScore / (effectiveRedScore + effectiveBlueScore), anchor: .trailing)
                    
                    
                    HStack {
                        VStack(alignment: .trailing, spacing: 16) {
                            ForEach(blueTeam.groups, id: \.number) { group in
                                FlagView(groupNumber: group.number)
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 16) {
                            ForEach(redTeam.groups, id: \.number) { group in
                                FlagView(groupNumber: group.number)
                            }
                        }
                    }
                    .padding()
                    
                    Rectangle()
                        .frame(width: 20)
                        .padding(.vertical, -40)

                }
                .padding(.vertical, 40)
            }
            .padding(32)
        }
    }
}

struct ClickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView(buzzerManager: BuzzerManager())
            .frame(width: 1920, height: 1080)
    }
}
