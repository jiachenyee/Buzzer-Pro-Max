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
    func makeUIView(context: Context) -> BouncyYJ {
        BouncyYJ {
            print("I AM A POTATO")
        } tappedOnZK: {
            print("I AM A TOMATO")
        }

    }
    
    func updateUIView(_ uiView: BouncyYJ, context: Context) {
        
    }
}
