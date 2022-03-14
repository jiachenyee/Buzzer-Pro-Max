//
//  SketchMessage.swift
//  Buzzer Pro Max (Shared)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import Foundation
import PencilKit

struct SketchMessage: iPadMessage {
    var sender: Sender = .iPad
    
    var group: Group
    
    var sendDate: Date
    
    var sketch: PKDrawing
}
