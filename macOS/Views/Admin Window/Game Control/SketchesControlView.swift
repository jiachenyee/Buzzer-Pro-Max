//
//  SketchesControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct SketchesControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    @State var query = DrawingQuery.all.shuffled()
    @State var roundNumber = 1
    
    var body: some View {
        VStack {
            Button {
                buzzerManager.gameInfo["questionsAssignment"] = nil
                
                let submissionDate = Date.now.addingTimeInterval(90).timeIntervalSince1970
                
                let groupList = buzzerManager.groupScores
                    .map { String($0.group.number) }
                    .joined(separator: "\n")
                
                buzzerManager.send(message: CommandMessage(sendDate: .now,
                                                           activeDate: .now.addingTimeInterval(2.5),
                                                           gameState: .sketches,
                                                           commandInfo: [
                                                            "submissionDate": String(submissionDate),
                                                            "query": String(query.map({ $0.query
                                                            }).joined(separator: "\n")),
                                                            "groupList": groupList,
                                                            "roundNumber": "\(roundNumber)"
                                                           ]))
                
                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                    buzzerManager.gameInfo["questionsAssignment"] = ""
                }
            } label: {
                Text("Start")
            }
            
            HStack {
                List(buzzerManager.groupScores, id: \.group) { groupScore in
                    let index = buzzerManager.groupScores.firstIndex(of: groupScore)!
                    HStack {
                        Text("\(groupScore.group.number)-\(groupScore.group.name)")
                            .frame(width: 400)
                            .multilineTextAlignment(.leading)
                        
                        Text(query[index * roundNumber].query)
                    }
                    .font(.system(size: 20))
                }
            }
        }
        .padding()
    }
}

struct SketchesControlView_Previews: PreviewProvider {
    static var previews: some View {
        SketchesControlView(buzzerManager: BuzzerManager())
    }
}
