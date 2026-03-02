//
//  StartScreen dark.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct MovrealIntroScreenView: View {
    var body: some View {
        ZStack {
            Color(red: 0.06, green: 0.09, blue: 0.16)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                ZStack {
                    // Logo/Asset Platzhalter
                    Rectangle()
                        .fill(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                        .frame(width: 128, height: 135)
                        .offset(x: -3, y: -119.49)
                        .shadow(color: .black.opacity(0.25), radius: 25, y: 25)

                    VStack(spacing: 12) {
                        Text("ATHLYZE MOVREAL")
                            .font(.system(size: 36, weight: .bold))
                            .tracking(0.37)
                            .foregroundStyle(Color(red: 0.68, green: 0.79, blue: 0.81))

                        VStack(spacing: 4) {
                            Text("Data-Driven Motion")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(Color(red: 0.43, green: 0.64, blue: 0.69))

                            Text("Virtual Precision")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(Color(red: 0.43, green: 0.64, blue: 0.69))
                        }
                    }
                    .frame(width: 334.66, height: 111.96)
                    .offset(y: 42)

                    // Soft pill glow unten
                    RoundedRectangle(cornerRadius: 23)
                        .fill(Color(red: 0.66, green: 0.82, blue: 0.86))
                        .frame(width: 132, height: 35)
                        .offset(y: 176.5)
                }
                .frame(width: 334.66, height: 331.94)

                Text("Tap to continue")
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
                    .padding(.top, 8)
            }
            .frame(width: 440, height: 956)
        }
    }
}

#Preview {
    MovrealIntroScreenView()
}
