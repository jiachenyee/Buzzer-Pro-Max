//
//  TimerView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct TimerView: View {
    
    var duration: Double
    
    @State var progress: CGFloat = 1
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color("TimerBackground"))
            Rectangle().fill(Color("TimerForeground"))
                .scaleEffect(x: progress)
        }
        .onAppear {
            withAnimation(.linear(duration: duration)) {
                progress = 0
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(duration: 30)
    }
}
