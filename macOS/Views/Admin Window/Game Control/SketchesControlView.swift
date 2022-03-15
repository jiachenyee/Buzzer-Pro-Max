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
    
    @State var previewImage: URL?
    
    var body: some View {
        VStack {
            Button {
                buzzerManager.gameInfo = [:]
                
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
            
            VStack {
                HStack {
                    VStack {
                        ForEach(buzzerManager.groupScores, id: \.group) { groupScore in
                            let index = buzzerManager.groupScores.firstIndex(of: groupScore)!
                            Button {
                                if let submission = buzzerManager.gameInfo["drawingSubmissions"]?
                                    .split(separator: "\n")
                                    .first(where: {
                                        URL(fileURLWithPath: String($0))
                                            .lastPathComponent
                                            .split(separator: "-")[0] == String(groupScore.group.number)
                                    }) {
                                    
                                    previewImage = URL(fileURLWithPath: String(submission))
                                }
                            } label: {
                                HStack {
                                    Text("\(groupScore.group.number)-\(groupScore.group.name)")
                                        .frame(width: 400)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(query[index * roundNumber].query)
                                    
                                    if let submission = buzzerManager.gameInfo["drawingSubmissions"] {
                                        
                                        let groupNumbers = submission.split(separator: "\n")
                                            .map { String(URL(fileURLWithPath: String($0))
                                                            .lastPathComponent
                                                            .split(separator: "-")[0]) }
                                        
                                        Text(groupNumbers
                                                .contains(String(groupScore.group.number)) ? "Submitted" : "Not Submitted")
                                        
                                    } else {
                                        Text("Not Submitted")
                                    }
                                }
                                .font(.system(size: 20))
                            }
                        }
                    }
                    
                    VStack {
                        if let previewImage = previewImage {
                            AsyncImage(url: previewImage)
                                .border(.red)
                            Button {
                                let groupNumber = previewImage.lastPathComponent.split(separator: "-")[0]
                                
                                let index = buzzerManager.groupScores.firstIndex(where: {
                                    groupNumber == String($0.group.number)
                                })!
                                
                                buzzerManager.gameInfo["displayDrawing"] = "\(previewImage.path)\n\(query[index * roundNumber].query)"
                                buzzerManager.send(message: CommandMessage(sendDate: .now, activeDate: .now, gameState: .sketches, commandInfo: [
                                    "drawGroup": String(groupNumber),
                                    "sendDate": String(Date.now.addingTimeInterval(45).timeIntervalSince1970)
                                ]))
                            } label: {
                                Text("Ask")
                            }
                        }
                    }
                }
                Spacer()
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
