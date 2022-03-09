//
//  TriviaManagerView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import SwiftUI

struct TriviaManagerView: View {
    
    var group: Group
    
    @ObservedObject var communicationManager: CommunicationManager
    
    var body: some View {
        Text("hello potato")
    }
}

struct TriviaManagerView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaManagerView(group: Group(number: 1, name: "cold chocolate"), communicationManager: CommunicationManager())
    }
}
