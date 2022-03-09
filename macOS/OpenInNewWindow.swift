//
//  OpenInNewWindow.swift
//  Buzzer Pro Max
//
//  Created by Jia Chen Yee on 9/3/22.
//

import Foundation
import SwiftUI

extension View {
    @discardableResult
    func openInWindow(title: String, sender: Any?) -> NSWindow {
        let controller = NSHostingController(rootView: self)
        let win = NSWindow(contentViewController: controller)
        win.contentViewController = controller
        win.title = title
        win.makeKeyAndOrderFront(sender)
        
        return win
    }
}
