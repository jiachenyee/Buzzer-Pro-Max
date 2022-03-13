//
//  BouncyYJView.swift
//  Buzzer Pro Max
//
//  Created by Jia Chen Yee on 13/3/22.
//

import Foundation
import SwiftUI
import UIKit

struct BouncyYJView: UIViewRepresentable {
    
    var tappedOnYJ: (() -> Void)
    var tappedOnZK: (() -> Void)
    
    func makeUIView(context: Context) -> BouncyYJ {
        BouncyYJ(tappedOnYJ: tappedOnYJ, tappedOnZK: tappedOnZK)
    }
    
    func updateUIView(_ uiView: BouncyYJ, context: Context) {
        
    }
}
