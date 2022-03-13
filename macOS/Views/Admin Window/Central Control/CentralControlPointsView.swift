//
//  CentralControlPointsView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct CentralControlPointsView: View {
    
    @Binding var groupScore: GroupScore
    
    @State var scoreText = "0"
    @State var isAlertPresented = false
    
    @State var newScore = 0.0
    
    var body: some View {
        HStack {
            Text("\(groupScore.group.number)-\(groupScore.group.name)")
                .font(.system(size: 20, weight: .regular))
            
            Spacer()
            
            TextField("Score", text: $scoreText)
                .font(.system(size: 20, weight: .regular))
                .frame(width: 100)
            
            Button {
                withAnimation {
                    groupScore.score += Double(scoreText) ?? 0
                }
            } label: {
                Text("Add")
                    .font(.system(size: 20, weight: .regular))
            }
            
            Button {
                newScore = Double(scoreText) ?? 0
                isAlertPresented = true
            } label: {
                Text("Set")
                    .font(.system(size: 20, weight: .regular))
            }
            .alert(isPresented: $isAlertPresented) {
                Alert(title: Text("Set group score"),
                      message: Text("Set group \(groupScore.group.number)-\(groupScore.group.name) to \(newScore)"), primaryButton: .destructive(Text("Yes")) {
                    withAnimation {
                        groupScore.score = newScore
                    }
                }, secondaryButton: .cancel())
            }
        }
        
    }
}

struct CentralControlPointsView_Previews: PreviewProvider {
    static var previews: some View {
        CentralControlPointsView(groupScore: .constant(.init(group: Group(number: 1, name: "hot chocolate"), score: 1)))
    }
}
