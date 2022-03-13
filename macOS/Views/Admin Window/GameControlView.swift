//
//  GameControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct GameControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GameControlView_Previews: PreviewProvider {
    static var previews: some View {
        GameControlView(buzzerManager: BuzzerManager())
    }
}
