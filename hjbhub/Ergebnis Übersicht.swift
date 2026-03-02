//
//  Ergebnis Übersicht.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct SessionResultsView: View {
    private let bg = Color(hex: "#020815")
    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let textPrimary = Color(hex: "#F3F4F6")
    private let textSecondary = Color(hex: "#99A1B3")
    private let accent = Color(hex: "#41B97D")

    var body: some View {
        ZStack(alignment: .topTrailing) {
            bg.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    progressHeader
                    headerBanner
                    scoreCard
                    summaryCard
                    actionButtons
                    metricsCard
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }

            Button {} label: {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(textSecondary)
                    .frame(width: 40, height: 40)
                    .background(panel)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(stroke, lineWidth: 1))
                    .shadow(color: .black.opacity(0.1), radius: 6, y: 4)
            }
            .padding(.top, 14)
            .padding(.trailing, 16)
        }
    }

    // MARK: Top Step Bar

    private var progressHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Schritt 6 von 6")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(textSecondary)
                Spacer()
                Text("100%")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(accent)
            }

            Capsule()
                .fill(accent)
                .frame(height: 8)

            HStack {
                StepPill(label: "Sportart", state: .done)
                Spacer()
                StepPill(label: "Übung", state: .done)
                Spacer()
                StepPill(label: "Raum", state: .done)
                Spacer()
                StepPill(label: "Avatar", state: .done)
                Spacer()
                StepPill(label: "Preview", state: .done)
                Spacer()
                StepPill(label: "Check", state: .active(number: "6"))
            }
        }
        .padding(.top, 16)
        .padding(.bottom, 12)
    }

    // MARK: Green Hero

    private var headerBanner: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Super Session! 🎉")
                .font(.system(size: 30, weight: .bold))
                .tracking(0.40)
                .foregroundStyle(.white)

            Text("Du hast großartige Fortschritte gemacht")
                .font(.system(size: 16))
                .foregroundStyle(Color(red: 0.94, green: 0.99, blue: 0.96))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.top, 48)
        .padding(.bottom, 24)
        .background(Color(red: 0.00, green: 0.79, blue: 0.31))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    // MARK: Score

    private var scoreCard: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 4) {
                Text("87")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundStyle(.clear) // wie im Design auskommentiert/unsichtbar
                    .overlay(
                        Text("87")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundStyle(Color.white.opacity(0.001))
                    )

                Text("Session Score")
                    .font(.system(size: 14))
                    .foregroundStyle(textSecondary)
            }

            HStack(spacing: 8) {
                Image(systemName: "arrow.up.right")
                    .foregroundStyle(Color(red: 0.02, green: 0.87, blue: 0.45))
                Text("+12% vs. letzte Session")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color(red: 0.02, green: 0.87, blue: 0.45))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(24)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(stroke, lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.10), radius: 10, y: 8)
    }

    // MARK: Summary

    private var summaryCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Session Zusammenfassung")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(textPrimary)

            SummaryRow(iconBg: Color(red: 0.04, green: 0.31, blue: 0.29).opacity(0.30),
                       icon: "calendar",
                       title: "Datum",
                       value: "10. Februar 2026, 14:30")

            SummaryRow(iconBg: Color(red: 0.53, green: 0.06, blue: 0.26).opacity(0.30),
                       icon: "figure.yoga",
                       title: "Übung",
                       value: "Yoga • Standwaage (Warrior III)")

            SummaryRow(iconBg: Color(red: 0.35, green: 0.09, blue: 0.55).opacity(0.30),
                       icon: "door.left.hand.open",
                       title: "VR-Raum",
                       value: "Zen-Hall")

            SummaryRow(iconBg: Color(red: 0.05, green: 0.33, blue: 0.17).opacity(0.30),
                       icon: "clock",
                       title: "Dauer",
                       value: "25 Minuten")
        }
        .padding(20)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(stroke, lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    // MARK: Actions

    private var actionButtons: some View {
        VStack(spacing: 12) {
            ActionButton(title: "Mit KI besprechen",
                         icon: "sparkles",
                         bg: Color(red: 0.00, green: 0.73, blue: 0.65),
                         fg: .white)

            ActionButton(title: "Mit Trainer/Therapeut besprechen",
                         icon: "person.2",
                         bg: Color(red: 0.23, green: 0.23, blue: 0.23).opacity(0.30),
                         fg: Color(red: 0.97, green: 0.98, blue: 0.99),
                         border: stroke)

            ActionButton(title: "Termin buchen",
                         icon: "calendar.badge.plus",
                         bg: Color(red: 0.23, green: 0.23, blue: 0.23).opacity(0.30),
                         fg: Color(red: 0.97, green: 0.98, blue: 0.99),
                         border: stroke)
        }
    }

    // MARK: Metrics

    private var metricsCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Wichtigste Metriken")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(textPrimary)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                MetricTile(value: "92%", label: "Balance Score",
                           valueColor: Color(red: 0.48, green: 0.95, blue: 0.66),
                           labelColor: Color(red: 0.02, green: 0.87, blue: 0.45),
                           bg: Color(red: 0.05, green: 0.33, blue: 0.17).opacity(0.20),
                           border: Color(red: 0.00, green: 0.40, blue: 0.19))

                MetricTile(value: "85°", label: "Hüftwinkel Ø",
                           valueColor: Color(red: 0.99, green: 0.65, blue: 0.84),
                           labelColor: Color(red: 0.98, green: 0.39, blue: 0.71),
                           bg: Color(red: 0.53, green: 0.06, blue: 0.26).opacity(0.20),
                           border: Color(red: 0.64, green: 0.00, blue: 0.30))

                MetricTile(value: "12", label: "Wiederholungen",
                           valueColor: Color(red: 0.85, green: 0.70, blue: 1.00),
                           labelColor: Color(red: 0.76, green: 0.48, blue: 1.00),
                           bg: Color(red: 0.35, green: 0.09, blue: 0.55).opacity(0.20),
                           border: Color(red: 0.43, green: 0.07, blue: 0.69))

                MetricTile(value: "3.2s", label: "Ø Haltezeit",
                           valueColor: Color(red: 0.33, green: 0.92, blue: 0.99),
                           labelColor: Color(red: 0.00, green: 0.83, blue: 0.95),
                           bg: Color(red: 0.06, green: 0.31, blue: 0.39).opacity(0.20),
                           border: Color(red: 0.00, green: 0.37, blue: 0.47))
            }

            Button {} label: {
                Text("Detaillierte Gelenkwinkel anzeigen")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color(red: 0.00, green: 0.84, blue: 0.75))
                    .frame(maxWidth: .infinity)
                    .frame(height: 36)
                    .background(Color(red: 0.23, green: 0.23, blue: 0.23).opacity(0.30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.00, green: 0.73, blue: 0.65), lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .buttonStyle(.plain)
        }
        .padding(20)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(stroke, lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: Subviews

private struct SummaryRow: View {
    let iconBg: Color
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(iconBg)
                .frame(width: 40, height: 40)
                .overlay(Image(systemName: icon).foregroundStyle(.white))

            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color(hex: "#F3F4F6"))
                Text(value)
                    .font(.system(size: 14))
                    .foregroundStyle(Color(hex: "#99A1B3"))
            }

            Spacer()
        }
    }
}

private struct ActionButton: View {
    let title: String
    let icon: String
    let bg: Color
    let fg: Color
    var border: Color = .clear

    var body: some View {
        Button {} label: {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .frame(width: 16, height: 16)
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                Spacer()
            }
            .foregroundStyle(fg)
            .padding(.horizontal, 16)
            .frame(height: 56)
            .background(bg)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(border, lineWidth: border == .clear ? 0 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.plain)
    }
}

private struct MetricTile: View {
    let value: String
    let label: String
    let valueColor: Color
    let labelColor: Color
    let bg: Color
    let border: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(valueColor)
            Text(label)
                .font(.system(size: 12))
                .foregroundStyle(labelColor)
        }
        .frame(maxWidth: .infinity, minHeight: 73, alignment: .leading)
        .padding(.horizontal, 12)
        .background(bg)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(border, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private struct StepPill: View {
    enum State {
        case done
        case active(number: String)
        case inactive(number: String)
    }

    let label: String
    let state: State

    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                switch state {
                case .done:
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.white)
                case .active(let number), .inactive(let number):
                    Text(number)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(textColor)
                }
            }
            .frame(width: 32, height: 32)
            .background(bgColor)
            .clipShape(Circle())

            Text(label)
                .font(.system(size: 12))
                .foregroundStyle(Color(hex: "#99A1B3"))
        }
    }

    private var bgColor: Color {
        switch state {
        case .done:
            return Color(hex: "#00C94F")
        case .active:
            return Color(hex: "#41B97D")
        case .inactive:
            return Color(hex: "#1E293B")
        }
    }

    private var textColor: Color {
        switch state {
        case .active:
            return .white
        default:
            return Color(hex: "#4A5565")
        }
    }
}

// MARK: Helpers

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

#Preview {
    SessionResultsView()
}
