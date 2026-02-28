//
//  ContentView.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 28.02.26.
//

import SwiftUI

struct ContentView: View {
    private let bg = Color(hex: "#F9FAFB")
    private let green = Color(hex: "#41B97D")
    private let dark = Color(hex: "#101828")
    private let textGray = Color(hex: "#6A7282")
    private let border = Color(hex: "#E5E7EB")

    var body: some View {
        ZStack(alignment: .bottom) {
            bg.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    header
                    actionTiles
                    sessionsSection
                    recommendationSection
                    Spacer(minLength: 90) // Platz für Bottom Nav
                }
            }

            bottomNavigation
        }
    }

    private var header: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Hi, Selina Laskowitz 👋")
                    .font(.system(size: 36 * 0.66, weight: .bold))
                    .foregroundStyle(.white)

                Text("Bereit für deine nächste Session?")
                    .font(.system(size: 16))
                    .foregroundStyle(.white.opacity(0.9))

                Button {
                    // TODO: Start Session
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "play")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Session starten")
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 64)
                    .background(dark)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.18), radius: 12, y: 6)
                }
                .padding(.top, 14)
            }
            .padding(.horizontal, 24)
            .padding(.top, 48)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(green)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .padding(.bottom, 8)

            Button {
                // TODO: Einstellungen / Modus
            } label: {
                Image(systemName: "moon")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(textGray)
                    .frame(width: 40, height: 40)
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.12), radius: 8, y: 4)
            }
            .padding(.top, 16)
            .padding(.trailing, 16)
        }
    }

    private var actionTiles: some View {
        HStack(spacing: 16) {
            ActionTile(
                title: "Training",
                icon: "figure.strengthtraining.traditional",
                iconBg: Color(hex: "#B3F7FE")
            )
            ActionTile(
                title: "Physiotherapie",
                icon: "heart",
                iconBg: Color(hex: "#D6C3DF")
            )
        }
        .padding(.horizontal, 24)
    }

    private var sessionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Letzte Sessions")
                .font(.system(size: 36 * 0.55, weight: .bold))
                .foregroundStyle(dark)

            SessionCard(title: "Yoga", date: "08.02.2026", duration: "25 Min", score: 87, trendUp: true)
            SessionCard(title: "Kampfsport", date: "05.02.2026", duration: "30 Min", score: 92, trendUp: true)
            SessionCard(title: "Physiotherapie", date: "02.02.2026", duration: "20 Min", score: 78, trendUp: false)
        }
        .padding(.horizontal, 24)
        .padding(.top, 4)
    }

    private var recommendationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Empfohlen für dich")
                .font(.system(size: 36 * 0.55, weight: .bold))
                .foregroundStyle(dark)

            VStack(alignment: .leading, spacing: 28) {
                Text("Virabhadrasana II")
                    .font(.system(size: 33 * 0.55, weight: .semibold))
                    .foregroundStyle(dark)

                HStack {
                    HStack(spacing: 8) {
                        Text("Yoga")
                            .font(.system(size: 12))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color(hex: "#E7F8BE"))
                            .clipShape(Capsule())

                        Text("15 Min")
                        Text("•")
                        Text("Mittel")
                    }
                    .font(.system(size: 14))
                    .foregroundStyle(Color(hex: "#4A5565"))

                    Spacer()

                    Button("Start") {}
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(green)
                        .frame(width: 58, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(green, lineWidth: 1)
                        )
                }
            }
            .padding(16)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(border, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .padding(.horizontal, 24)
    }

    private var bottomNavigation: some View {
        HStack {
            NavItem(title: "Home", icon: "house", isActive: true)
            NavItem(title: "Training", icon: "figure.strengthtraining.traditional", isActive: false)
            NavItem(title: "Community", icon: "person.2", isActive: false)
            NavItem(title: "Chat", icon: "bubble.left", isActive: false)
            NavItem(title: "Profil", icon: "person", isActive: false)
        }
        .padding(.horizontal, 14)
        .padding(.top, 10)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity)
        .background(.white)
        .overlay(Rectangle().frame(height: 1).foregroundStyle(border), alignment: .top)
    }
}

// MARK: - Subviews

private struct ActionTile: View {
    let title: String
    let icon: String
    let iconBg: Color

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle().fill(iconBg).frame(width: 48, height: 48)
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(Color(hex: "#374151"))
            }

            Text(title)
                .font(.system(size: 32 * 0.5, weight: .medium))
                .foregroundStyle(Color(hex: "#101828"))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 112)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "#E5E7EB"), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

private struct SessionCard: View {
    let title: String
    let date: String
    let duration: String
    let score: Int
    let trendUp: Bool

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(title)
                        .font(.system(size: 32 * 0.56, weight: .semibold))
                        .foregroundStyle(Color(hex: "#101828"))
                    Image(systemName: trendUp ? "arrow.up.right" : "arrow.down.right")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(trendUp ? Color(hex: "#22C55E") : Color(hex: "#F43F5E"))
                }

                HStack(spacing: 10) {
                    Text(date)
                    Text("•")
                    Text(duration)
                }
                .font(.system(size: 14))
                .foregroundStyle(Color(hex: "#4A5565"))
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 2) {
                Text("\(score)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color(hex: "#41B97D"))
                Text("Score")
                    .font(.system(size: 12))
                    .foregroundStyle(Color(hex: "#6A7282"))
            }
        }
        .padding(16)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "#E5E7EB"), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

private struct NavItem: View {
    let title: String
    let icon: String
    let isActive: Bool

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
            Text(title)
                .font(.system(size: 12))
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(isActive ? Color(hex: "#41B97D") : Color(hex: "#6A7282"))
    }
}

// MARK: - Helpers

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
    ContentView()
}
