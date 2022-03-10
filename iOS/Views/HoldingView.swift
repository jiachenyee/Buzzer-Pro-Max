//
//  HoldingView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 8/3/22.
//

import SwiftUI

struct HoldingView: View {
    
    var group: Group?
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                Text("Swift Innovators’ Summit 2022")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Text(group?.name ?? "")
                    .foregroundColor(.white)
                if let group = group {
                    FlagView(groupNumber: group.number)
                        .frame(height: 100)
                        .padding()
                }
                
                Spacer()
            }
        }
    }
}

struct HoldingView_Previews: PreviewProvider {
    static var previews: some View {
        HoldingView()
    }
}
