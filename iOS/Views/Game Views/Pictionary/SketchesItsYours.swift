//
//  SketchesItsYours.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 15/3/22.
//

import SwiftUI

struct SketchesItsYours: View {
    
    var group: Group
    
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
                
                Spacer()
                
                Text("This is your drawing.")
                    .font(.system(size: 48, weight: .bold))
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .foregroundColor(.white)
        }
    }
}

struct SketchesItsYours_Previews: PreviewProvider {
    static var previews: some View {
        SketchesItsYours(group: Group(number: 1, name: "potaot"))
    }
}
