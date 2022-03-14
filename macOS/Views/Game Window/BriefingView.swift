//
//  BriefingView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Rui Yang on 15/3/22.
//

import SwiftUI

struct BriefingView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        Image("Briefing\(buzzerManager.briefingSlide)")
            .resizable()
            .scaledToFill()
    }
}

struct BriefingView_Previews: PreviewProvider {
    static var previews: some View {
        BriefingView(buzzerManager: BuzzerManager())
    }
}
