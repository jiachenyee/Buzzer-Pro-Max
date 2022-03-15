//
//  SketchesGameView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct SketchesGameView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    @State var isActive = false
    
    @State var isSubmissionStage = false
    
    var body: some View {
        if let questionAssignment = buzzerManager.gameInfo["questionsAssignment"] {
            VStack(alignment: .leading) {
                TimerView(duration: 90)
                    .frame(height: 30)
                    .padding(.vertical, 30)
                
                VStack(alignment: .leading) {
                    Text("Challenge 2")
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Skill-free Sketching Skirmish")
                        .font(.system(size: 36, weight: .bold))
                    
                    Spacer()
                    
                    if !isSubmissionStage {
                        Text("Draw what’s described on your iPad")
                            .font(.system(size: 72, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    } else {
                        if let displayDrawing = buzzerManager.gameInfo["displayDrawing"]?.split(separator: "\n") {
                            ZStack(alignment: .center) {
                                Color.clear
                                AsyncImage(url: URL(fileURLWithPath: String(displayDrawing[0])))
                            }
                        } else {
                            Text("Collating Responses... give it a second.")
                                .font(.system(size: 72, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            if let submissions = buzzerManager.gameInfo["drawingSubmissions"]?.split(separator: "\n") {
                                Text("\(submissions.count) Submissions")
                            } else {
                                Text("No Submissions")
                            }
                        }
                    }
                }
                .padding(32)
                .onAppear {
                    isSubmissionStage = false
                    
                    Timer.scheduledTimer(withTimeInterval: 90, repeats: false) { _ in
                        isSubmissionStage = true
                    }
                }
            }
        } else {
            Image("Holding")
                .resizable()
                .scaledToFill()
        }
    }
}

struct SketchesGameView_Previews: PreviewProvider {
    static var previews: some View {
        SketchesGameView(buzzerManager: BuzzerManager())
    }
}
