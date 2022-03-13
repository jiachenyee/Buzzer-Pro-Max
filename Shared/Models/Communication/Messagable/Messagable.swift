//
//  Messagable.swift
//  Buzzer Pro Max
//
//  Created by Jia Chen Yee on 9/3/22.
//

import Foundation

protocol Messagable: Codable {
    var sender: Sender { get set }
    var sendDate: Date { get set }
    
    func toJSONData() -> Data?
    
    static func from(data: Data) -> Self?
}
