//
//  FlagView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 9/3/22.
//

import SwiftUI

struct FlagView: View {
    
    var groupNumber: Int
    
    var body: some View {
        GeometryReader { context in
            ZStack {
                Color("Group\(groupNumber)")
                Image("Group\(groupNumber)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: context.size.height / 1.5)
                
            }
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        Flag(groupNumber: 1)
    }
}
