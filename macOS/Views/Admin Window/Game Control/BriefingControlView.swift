//
//  BriefingControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct BriefingControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BriefingControlView_Previews: PreviewProvider {
    static var previews: some View {
        BriefingControlView()
    }
}
