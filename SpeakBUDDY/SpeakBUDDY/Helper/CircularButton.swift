//
//  CircularButton.swift
//  SpeakBUDDY
//
//  Created by Al-Amin on 2025/04/09.
//

import SwiftUI

struct CircularButton: View {
    var systemImageName: String
    var fontSize: CGFloat
    var width: CGFloat
    var height: CGFloat
    var color: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImageName)
                .font(.custom("HiraginoSans-W6", size: fontSize))
                .foregroundColor(color)
                .frame(width: width, height: height)
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 2)
                .imageScale(.small)
        }
    }
}
