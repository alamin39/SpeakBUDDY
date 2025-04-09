//
//  ContentView.swift
//  SpeakBUDDY
//
//  Created by Al-Amin on 2025/04/09.
//

import SwiftUI

struct ContentView: View {
    private let foregroundColor = Color(red: 50/255, green: 53/255, blue: 55/255)
    
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width

            ZStack {
                backgroundView
                mainContent(width: width, height: height)
            }
            .frame(width: width, height: height)
        }
    }

    // MARK: - Background
    private var backgroundView: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 213/255, green: 210/255, blue: 1),
                Color.clear
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }

    // MARK: - Main Content
    private func mainContent(width: CGFloat, height: CGFloat) -> some View {
        VStack {
            headerView(width: width, height: height)
            welcomeMessage(width: width)
            barChartSection(width: width, height: height)
            levelUpMessage(width: width, height: height)
            registerButton(width: width, height: height)
        }
    }

    // MARK: - Header
    private func headerView(width: CGFloat, height: CGFloat) -> some View {
        HStack {
            Spacer()
            CircularButton(
                systemImageName: "xmark",
                fontSize: min(width * 20/390, 28),
                width: min(width * 38/390, 50),
                height: min(height * 38/844, 50),
                color: foregroundColor,
                action: {}
            )
            .padding()
        }
    }

    // MARK: - Welcome Text
    private func welcomeMessage(width: CGFloat) -> some View {
        VStack {
            Text("Hello")
                .font(.system(size: min(width * 36/390, 54), weight: .bold))
                .foregroundColor(foregroundColor)
            Text("SpeakBUDDY")
                .font(.system(size: min(width * 36/390, 54), weight: .bold))
                .foregroundColor(foregroundColor)
        }
    }

    // MARK: - Bar Chart Section
    private func barChartSection(width: CGFloat, height: CGFloat) -> some View {
        ZStack(alignment: .top) {
            HStack {
                Image(.protty)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 187.72/390, height: height * 160/844)
                    .padding(.leading, width * 22.48/390)
                Spacer()
            }
            BarChartView(height: height, width: width)
                .padding(.top, height * 52.15/844)
        }
        .padding(.top, height * 32.85/844)
    }

    // MARK: - Level Up Message
    private func levelUpMessage(width: CGFloat, height: CGFloat) -> some View {
        VStack {
            Text("スピークバディで")
                .font(.custom("HiraginoSans-W5", size: min(width * 20/390, 30)))
                .foregroundColor(foregroundColor)

            gradientText(
                text: "レベルアップ",
                fontSize: min(width * 30/390, 45),
                gradient: Gradient(colors: [
                    Color(red: 111/255, green: 212/255, blue: 1),
                    Color(red: 0, green: 117/255, blue: 1)
                ])
            )
        }
        .padding(.top, height * 30/844)
    }

    // MARK: - Register Button
    private func registerButton(width: CGFloat, height: CGFloat) -> some View {
        Button(action: {}) {
            Text("プランに登録する")
                .font(.custom("HiraginoSans-W5", size: min(width * 16/390, 24)))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(red: 59/255, green: 167/255, blue: 1))
                .foregroundColor(.white)
                .cornerRadius(28.66)
        }
        .padding(EdgeInsets(top: height * 25/844, leading: width * 20/390, bottom: height * 54/844, trailing: width * 20/390))
    }

    // MARK: - Gradient Text Helper
    private func gradientText(text: String, fontSize: CGFloat, gradient: Gradient) -> some View {
        Text(text)
            .font(.custom("HiraginoSans-W6", size: fontSize))
            .foregroundColor(.clear)
            .overlay(
                LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                    .mask(
                        Text(text)
                            .font(.custom("HiraginoSans-W6", size: fontSize))
                    )
            )
    }
}

#Preview {
    ContentView()
}
