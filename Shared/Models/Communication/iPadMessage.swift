//
//  iPadMessage.swift
//  Buzzer Pro Max
//
//  Created by Jia Chen Yee on 9/3/22.
//

import Foundation

protocol iPadMessage: Messagable, Codable {
    var group: Group { get set }
}
