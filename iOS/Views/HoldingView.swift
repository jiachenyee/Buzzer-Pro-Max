//
//  HoldingView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 8/3/22.
//

import SwiftUI

struct HoldingView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                Text("Swift Innovators’ Summit 2022")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
            }
        }
    }
}

struct HoldingView_Previews: PreviewProvider {
    static var previews: some View {
        HoldingView()
    }
}
