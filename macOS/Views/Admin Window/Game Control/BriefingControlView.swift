//
//  BriefingControlView.swift
//  Buzzer Pro Max (macOS)
//
//  Created by Jia Chen Yee on 14/3/22.
//

import SwiftUI

struct BriefingControlView: View {
    
    @ObservedObject var buzzerManager: BuzzerManager
    
    var body: some View {
        HStack {
            ScrollView {
                
                VStack {
                    Button {
                        buzzerManager.briefingSlide = 0
                    } label: {
                        Image("Briefing0")
                            .resizable()
                            .scaledToFit()
                            .padding(4)
                            .padding(.horizontal, 8)
                            .background(Color(NSColor.darkGray))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.borderless)
                    .padding(.bottom)
                    
                    Button {
                        buzzerManager.briefingSlide = 1
                    } label: {
                        Image("Briefing1")
                            .resizable()
                            .scaledToFit()
                            .padding(4)
                            .padding(.horizontal, 8)
                            .background(Color(NSColor.darkGray))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.borderless)
                    .padding(.bottom)
                    
                    Button {
                        buzzerManager.briefingSlide = 2
                    } label: {
                        Image("Briefing2")
                            .resizable()
                            .scaledToFit()
                            .padding(4)
                            .padding(.horizontal, 8)
                            .background(Color(NSColor.darkGray))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.borderless)
                    .padding(.bottom)
                    
                    Button {
                        buzzerManager.briefingSlide = 3
                    } label: {
                        Image("Briefing3")
                            .resizable()
                            .scaledToFit()
                            .padding(4)
                            .padding(.horizontal, 8)
                            .background(Color(NSColor.darkGray))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.borderless)
                    .padding(.bottom)
                    
                    Button {
                        buzzerManager.briefingSlide = 4
                    } label: {
                        Image("Briefing4")
                            .resizable()
                            .scaledToFit()
                            .padding(4)
                            .padding(.horizontal, 8)
                            .background(Color(NSColor.darkGray))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.borderless)
                    .padding(.bottom)
                    
                }.frame(maxWidth: 400)
            }
            Image("Briefing\(buzzerManager.briefingSlide)")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
    }
}

struct BriefingControlView_Previews: PreviewProvider {
    static var previews: some View {
        BriefingControlView(buzzerManager: BuzzerManager())
    }
}
