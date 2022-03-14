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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SketchesControlView_Previews: PreviewProvider {
    static var previews: some View {
        SketchesControlView(buzzerManager: BuzzerManager())
    }
}
