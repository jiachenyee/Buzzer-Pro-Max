//
//  Messagable+CodableUtils.swift
//  Buzzer Pro Max (Shared)
//
//  Created by Jia Chen Yee on 10/3/22.
//

import Foundation

extension Messagable {
    func toJSONData() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    static func from(data: Data) -> Self? {
        let decoder = JSONDecoder()
        
        return try? decoder.decode(self, from: data)
    }
}
