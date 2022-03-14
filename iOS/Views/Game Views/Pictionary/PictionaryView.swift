//
//  PictionaryView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 13/3/22.
//

import SwiftUI
import PencilKit

struct PictionaryView: View {
    var group: Group
    
    @State var canvas = PKCanvasView()
    
    @ObservedObject var communicationManager: CommunicationManager
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Challenge 2")
                            .font(.system(size: 36, weight: .bold))
                        
                        Text("Skill-free Sketching Skirmish")
                            .font(.system(size: 64, weight: .bold))
                    }
                    
                    Spacer()
                    
                    FlagView(groupNumber: group.number)
                        .frame(width: 200)
                }
                .padding()
                
                ZStack(alignment: .top) {
                    CanvasView(canvasView: $canvas)
                    
                    Text("Draw ZK Toon")
                        .foregroundColor(.black)
                        .font(.system(size: 36, weight: .bold))
                        .padding()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .foregroundColor(.white)
        }
    }
}

struct PictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        PictionaryView(group: Group(number: 1, name: "cold chocolate"), communicationManager: .init())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
