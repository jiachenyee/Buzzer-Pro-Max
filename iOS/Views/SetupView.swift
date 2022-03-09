//
//  SetupView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 9/3/22.
//

import SwiftUI

struct SetupView: View {
    
    #warning("Any pairing work should be done here.")
    
    @Binding var group: Group?
    
    @State var groupName: String = "cold chocolate"
    
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
                
                Picker("Groups", selection: $groupName) {
                    ForEach(Group.groups) { group in
                        Text("\(group.number)-\(group.name)")
                            .tag(group.name)
                    }
                }
                
                Button("Go") {
                    group = Group.groups.first { $0.name == groupName }
                }
                .buttonStyle(.bordered)
                .padding()
            }
        }
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView(group: .constant(Group(number: 1, name: "cold chocolate")))
    }
}
