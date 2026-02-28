//
//  StartScreen.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 28.02.26.
//

import SwiftUI

struct SplashScreenView: View {
    private let logoURL = URL(string: "https://www.figma.com/api/mcp/asset/7b636e53-4343-4a98-8c96-9d1c1d9274fc")

    var body: some View {
        ZStack {
            Color(hex: "#DBFCFF")
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                VStack(spacing: 12) {
                    AsyncImage(url: logoURL) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        case .failure(_):
                            Image(systemName: "cube.transparent")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(Color(hex: "#1E73BE"))
                        default:
                            ProgressView()
                                .tint(Color(hex: "#1E73BE"))
                        }
                    }
                    .frame(width: 128, height: 135)
                    .shadow(color: .black.opacity(0.18), radius: 25, y: 10)

                    HStack(spacing: 0) {
                        Text("ATHLYZE MO")
                            .foregroundStyle(Color(hex: "#454545"))
                        Text("VR")
                            .foregroundStyle(Color(hex: "#38C3E1"))
                        Text("EAL")
                            .foregroundStyle(Color(hex: "#454545"))
                    }
                    .font(.system(size: 52 * 0.66, weight: .bold))

                    VStack(spacing: 4) {
                        Text("Data-Driven Motion")
                        Text("Virtual Precision")
                    }
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(Color(hex: "#4A5565"))
                }

                Spacer().frame(height: 56)

                Button {
                    // TODO: Weiter zur nächsten View
                } label: {
                    Text("Tap to continue")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "#6A7282"))
                        .padding(.horizontal, 18)
                        .frame(height: 35)
                        .background(
                            LinearGradient(
                                colors: [
                                    Color(hex: "#97DFEC"),
                                    Color(hex: "#6EAEDC").opacity(0.7)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(Capsule())
                }

                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

// MARK: - Helper

private extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: UInt64
        switch hex.count {
        case 6:
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (255, 255, 255)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}

#Preview {
    SplashScreenView()
}
