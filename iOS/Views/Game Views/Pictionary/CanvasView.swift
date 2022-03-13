//
//  CanvasView.swift
//  Buzzer Pro Max (iOS)
//
//  Created by Jia Chen Yee on 13/3/22.
//

import Foundation
import PencilKit
import SwiftUI

struct CanvasView: UIViewRepresentable {
    
    @Binding var canvasView: PKCanvasView
    @State var toolPicker = PKToolPicker()
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.tool = PKInkingTool(.pen, color: .gray, width: 10)
        canvasView.drawingPolicy = .anyInput
        canvasView.delegate = context.coordinator
        showToolPicker()
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(canvasView: $canvasView)
    }
    
    func showToolPicker() {
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
    
    class Coordinator: NSObject, PKCanvasViewDelegate {
        var canvasView: Binding<PKCanvasView>
        
        // MARK: - Initializers
        init(canvasView: Binding<PKCanvasView>) {
            self.canvasView = canvasView
//            self.onSaved = onSaved
        }
        
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            if !canvasView.drawing.bounds.isEmpty {
//                onSaved()
            }
        }
    }

}
