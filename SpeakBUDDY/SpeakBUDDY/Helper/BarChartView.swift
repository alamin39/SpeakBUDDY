//
//  BarChartView.swift
//  SpeakBUDDY
//
//  Created by Al-Amin on 2025/04/09.
//

import SwiftUI

struct BarChartView: View {
    @State private var animateBars = false
    
    private let barHeights: [CGFloat] = [66, 100, 220, 300]
    private let labels = ["現在", "3ヶ月", "1年", "2年"]
    
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: width * 26/390) {
                ForEach(0..<barHeights.count, id: \.self) { index in
                    VStack {
                        TopRoundedRectangle(radius: 2.73)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 31/255, green: 143/255, blue: 1),
                                        Color(red: 88/255, green: 192/255, blue: 1)
                                    ]),
                                    startPoint: .bottom,
                                    endPoint: .top)
                            )
                            .frame(width: width * 48/390, height: height * barHeights[index]/844)
                            .scaleEffect(y: animateBars ? 1 : 0, anchor: .bottom)
                            .animation(.easeOut(duration: 1.5), value: animateBars)
                        
                        Text(labels[index])
                            .font(.custom("HiraginoSans-W6", size: min(width * 12/390, 18)))
                            .foregroundColor(Color(red: 50/255, green: 53/255, blue: 55/255))
                    }
                }
            }
            .frame(height: height * 325/844)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                animateBars = true
            }
        }
    }
}
