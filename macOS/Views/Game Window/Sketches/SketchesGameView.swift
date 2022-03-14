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
                
                Text("Draw what’s described on your iPad")
                    .font(.system(size: 72, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding(32)
        }
        
        if !isSubmissionStage {
            
        } else {
            if let submissions = buzzerManager.gameInfo["drawingSubmissions"]?.split(separator: "\n") {
                
            } else {
                Text("Gathering drawings")
            }
        }
    }
}

struct SketchesGameView_Previews: PreviewProvider {
    static var previews: some View {
        SketchesGameView(buzzerManager: BuzzerManager())
    }
}
