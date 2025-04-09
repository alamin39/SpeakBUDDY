//
//  TopRoundedRectangle.swift
//  SpeakBUDDY
//
//  Created by Al-Amin on 2025/04/09.
//

import SwiftUI

struct TopRoundedRectangle: Shape {
    var radius: CGFloat = 2.73
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY)) // bottom-left
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + radius)) // up
        path.addQuadCurve(to: CGPoint(x: rect.minX + radius, y: rect.minY),
                          control: CGPoint(x: rect.minX, y: rect.minY)) // top-left curve
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY)) // top line
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + radius),
                          control: CGPoint(x: rect.maxX, y: rect.minY)) // top-right curve
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // down
        path.closeSubpath()

        return path
    }
}
