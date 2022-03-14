//
//  SketchesControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct SketchesControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        Button {
            buzzerManager.send(message: CommandMessage(sendDate: .now, activeDate: .now, gameState: .sketches, commandInfo: [:]))
        } label: {
            Text("Start")
        }
    }
}

struct SketchesControlView_Previews: PreviewProvider {
    static var previews: some View {
        SketchesControlView(buzzerManager: BuzzerManager())
    }
}
