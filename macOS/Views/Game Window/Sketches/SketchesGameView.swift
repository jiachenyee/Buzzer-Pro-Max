//
//  SketchesGameView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct SketchesGameView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        if let submissions = buzzerManager.gameInfo["drawingSubmissions"]?.split(separator: "\n") {
            
        } else {
            Text("Gathering drawings")
        }
    }
}

struct SketchesGameView_Previews: PreviewProvider {
    static var previews: some View {
        SketchesGameView(buzzerManager: BuzzerManager())
    }
}
