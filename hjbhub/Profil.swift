//
//  Profil.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 28.02.26.
//

import SwiftUI

struct ProfileScreenView: View {
    private let bg = Color(hex: "#020815")
    private let card = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let accent = Color(hex: "#41B97D")
    private let headerCyan = Color(hex: "#00B8DB")

    var body: some View {
        ZStack(alignment: .bottom) {
            bg.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    header
                    statsRow
                    goalsSection
                    settingsSection
                    Spacer(minLength: 110)
                }
                .padding(.bottom, 16)
            }

            bottomNavigation
        }
    }

    // MARK: - Header

    private var header: some View {
        HStack(spacing: 16) {
            Circle()
                .fill(Color.white.opacity(0.25))
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(.white)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text("Selina Laskowitz")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)

                Text("SV Musterhausen e.V.")
                    .font(.system(size: 16))
                    .foregroundStyle(Color(hex: "#EEFFFF"))
            }

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 24)
        .padding(.top, 48)
        .padding(.bottom, 24)
        .background(headerCyan)
        .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))
    }

    // MARK: - Stats

    private var statsRow: some View {
        HStack(spacing: 12) {
            StatCard(icon: "figure.walk", value: "127", label: "Sessions")
            StatCard(icon: "star.fill", value: "2450", label: "Punkte")
            StatCard(icon: "calendar", value: "24", label: "Wochen")
        }
        .padding(.horizontal, 24)
    }

    // MARK: - Goals

    private var goalsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Ziele & Fortschritt")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color(hex: "#F3F4F6"))

                Spacer()

                Button("Mit Trainer besprechen") {}
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color(hex: "#00D4F2"))
            }

            GoalCard(
                title: "Balance verbessern",
                percentText: "65%",
                target: "Ziel: 100 Sessions",
                progress: 0.65
            )

            GoalCard(
                title: "Schultermobilität",
                percentText: "45%",
                target: "Ziel: 30 Übungen",
                progress: 0.45
            )

            GoalCard(
                title: "Wöchentliches Training",
                percentText: "80%",
                target: "Ziel: 5x pro Woche",
                progress: 0.80
            )
        }
        .padding(.horizontal, 24)
    }

    // MARK: - Settings

    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Einstellungen")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color(hex: "#F3F4F6"))

            VStack(spacing: 8) {
                SettingsRow(icon: "list.bullet.clipboard", iconBg: Color(hex: "#0E4F63").opacity(0.3), title: "Trainingsplan")
                SettingsRow(icon: "visionpro", iconBg: Color(hex: "#1B3A94").opacity(0.3), title: "VR Setup")
                SettingsRow(icon: "lock.shield", iconBg: Color(hex: "#0C542B").opacity(0.3), title: "Datenschutz & Freigabe")
                SettingsRow(icon: "square.and.arrow.up", iconBg: Color(hex: "#5A1790").opacity(0.3), title: "Export (PDF/CSV)")
                SettingsRow(icon: "person.3", iconBg: Color(hex: "#7D290D").opacity(0.3), title: "Community beitreten")
                SettingsRow(icon: "calendar.badge.clock", iconBg: Color(hex: "#7D290D").opacity(0.3), title: "Terminverwaltung")
            }
        }
        .padding(.horizontal, 24)
    }

    // MARK: - Bottom Nav

    private var bottomNavigation: some View {
        HStack {
            BottomItem(icon: "house", title: "Home", active: false)
            BottomItem(icon: "figure.strengthtraining.traditional", title: "Training", active: false)
            BottomItem(icon: "person.2", title: "Community", active: false)
            BottomItem(icon: "bubble.left", title: "Chat", active: false)
            BottomItem(icon: "person", title: "Profil", active: true)
        }
        .padding(.horizontal, 14)
        .padding(.top, 10)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity)
        .background(Color(hex: "#0F172A"))
        .overlay(alignment: .top) {
            Rectangle().fill(stroke).frame(height: 1)
        }
    }
}

// MARK: - Components

private struct StatCard: View {
    let icon: String
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(Color(hex: "#F3F4F6"))

            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(Color(hex: "#F3F4F6"))

            Text(label)
                .font(.system(size: 12))
                .foregroundStyle(Color(hex: "#99A1B1"))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 161)
        .background(Color(hex: "#0F172A"))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "#1E293B"), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

private struct GoalCard: View {
    let title: String
    let percentText: String
    let target: String
    let progress: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color(hex: "#F3F4F6"))

                Spacer()

                Text(percentText)
                    .font(.system(size: 14))
                    .foregroundStyle(Color(hex: "#99A1B1"))
            }

            ProgressView(value: progress)
                .tint(Color(hex: "#41B97D"))
                .scaleEffect(x: 1, y: 1.8, anchor: .center)

            Text(target)
                .font(.system(size: 12))
                .foregroundStyle(Color(hex: "#99A1B1"))
        }
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 120, alignment: .leading)
        .background(Color(hex: "#0F172A"))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "#1E293B"), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

private struct SettingsRow: View {
    let icon: String
    let iconBg: Color
    let title: String

    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Circle()
                    .fill(iconBg)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: icon)
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(Color(hex: "#F3F4F6"))
                    )

                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color(hex: "#F3F4F6"))
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color(hex: "#99A1B1"))
        }
        .padding(.horizontal, 16)
        .frame(height: 73)
        .background(Color(hex: "#0F172A"))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "#1E293B"), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

private struct BottomItem: View {
    let icon: String
    let title: String
    let active: Bool

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
            Text(title)
                .font(.system(size: 12, weight: .medium))
        }
        .foregroundStyle(active ? Color(hex: "#41B97D") : Color(hex: "#99A1B3"))
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Helpers

private extension Color {
    init(hex: String) {
        let cleaned = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var value: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&value)

        let r, g, b: UInt64
        switch cleaned.count {
        case 6:
            (r, g, b) = (value >> 16, (value >> 8) & 0xFF, value & 0xFF)
        default:
            (r, g, b) = (255, 255, 255)
        }

        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: 1)
    }
}

private struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        Path(
            UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            ).cgPath
        )
    }
}

#Preview {
    ProfileScreenView()
}
