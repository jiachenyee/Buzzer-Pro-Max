//
//  GameView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            Color.black
            Text("Actual game")
        }
        .navigationTitle("Game")
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
