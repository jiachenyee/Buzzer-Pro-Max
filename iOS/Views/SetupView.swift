//
//  SetupView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 9/3/22.
//

import SwiftUI

struct SetupView: View {
    
    @Binding var group: Group?
    
    @State var groupName: String = "cold chocolate"
    
    @ObservedObject var communicationManager: CommunicationManager
    
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
                    ForEach(Group.all) { group in
                        Text("\(group.number)-\(group.name)")
                            .tag(group.name)
                    }
                }
                
                Button("Go") {
                    group = Group.all.first { $0.name == groupName }
                    
                    communicationManager.join(with: group!)
                }
                .buttonStyle(.bordered)
                .padding()
            }
        }
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView(group: .constant(Group(number: 1, name: "cold chocolate")),
                  communicationManager: CommunicationManager())
    }
}
