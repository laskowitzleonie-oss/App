//
//  Session Schritt 6.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct OnboardingStep6ChecklistView: View {
    private let bg = Color(hex: "#020815")
    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let textPrimary = Color(hex: "#F3F4F6")
    private let textSecondary = Color(hex: "#99A1B3")
    private let accent = Color(hex: "#41B97D")

    @State private var checks: [Bool] = [false, false, false, false, false]

    private var allChecked: Bool { checks.allSatisfy { $0 } }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            bg.ignoresSafeArea()

            VStack(spacing: 0) {
                progressHeader

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        backButton

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Checkliste")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(textPrimary)

                            Text("Stelle sicher, dass alles bereit ist")
                                .font(.system(size: 16))
                                .foregroundStyle(textSecondary)
                        }

                        liveSystemChecksCard
                        manualCheckCard
                        infoCard

                        Spacer(minLength: 120)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                }
            }

            Button {} label: {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(textSecondary)
                    .frame(width: 40, height: 40)
                    .background(panel)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(stroke, lineWidth: 1))
            }
            .padding(.top, 14)
            .padding(.trailing, 16)

            bottomBar
        }
    }

    // MARK: Header

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
        .padding(.horizontal, 24)
        .padding(.top, 16)
        .padding(.bottom, 12)
        .background(panel)
        .overlay(alignment: .bottom) {
            Rectangle().fill(stroke).frame(height: 1)
        }
    }

    private var backButton: some View {
        Button {} label: {
            HStack(spacing: 8) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .semibold))
                Text("Zurück")
                    .font(.system(size: 14, weight: .medium))
            }
            .foregroundStyle(textSecondary)
            .padding(.horizontal, 12)
            .frame(height: 36)
        }
        .buttonStyle(.plain)
    }

    // MARK: Cards

    private var liveSystemChecksCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(accent)
                Text("Live System-Checks")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(textPrimary)
            }

            StatusRow(title: "MoCap verbunden", badge: "Verbunden")
            StatusRow(title: "Avatar erstellt", badge: "Bereit")
            StatusRow(title: "VR-Brille bereit", badge: "Erkannt")
        }
        .padding(20)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(stroke, lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var manualCheckCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Manuelle Prüfung")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(textPrimary)

            ChecklistRow(
                title: "Avatar passt und sieht gut aus",
                checked: $checks[0]
            )
            ChecklistRow(
                title: "MoCap Anzug sitzt korrekt",
                checked: $checks[1]
            )
            ChecklistRow(
                title: "OptiTrack: Avatar wurde erstellt",
                checked: $checks[2]
            )
            ChecklistRow(
                title: "Ich kenne die Übungen",
                checked: $checks[3]
            )
            ChecklistRow(
                title: "Sichere Umgebung / genug Platz vorhanden",
                checked: $checks[4]
            )
        }
        .padding(20)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(stroke, lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var infoCard: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "info.circle")
                .foregroundStyle(Color(hex: "#86C5FF"))
                .font(.system(size: 20))

            VStack(alignment: .leading, spacing: 8) {
                Text("Gleich geht's los!")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color(hex: "#DBECFF"))

                Text("Gleich geht's in VR weiter. Lege das Handy weg und setze die Brille auf. Du kommst nach der Session automatisch zurück für die Ergebnisse.")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(hex: "#BFDBFE"))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(20)
        .background(Color(hex: "#1C3A8F").opacity(0.20))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "#1D4ED8"), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    // MARK: Bottom CTA

    private var bottomBar: some View {
        VStack {
            Spacer()

            VStack {
                Button {} label: {
                    Text("Checkliste vervollständigen")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color(hex: "#00C94F"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .opacity(allChecked ? 1.0 : 0.5)
                }
                .buttonStyle(.plain)
                .disabled(!allChecked)
                .padding(.horizontal, 24)
                .padding(.top, 24)
                .padding(.bottom, 16)
            }
            .background(panel)
            .overlay(alignment: .top) {
                Rectangle().fill(stroke).frame(height: 1)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

// MARK: Reusable Views

private struct StatusRow: View {
    let title: String
    let badge: String

    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Circle()
                    .fill(Color(hex: "#0C542B").opacity(0.30))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "checkmark")
                            .foregroundStyle(Color(hex: "#7AF3A8"))
                    )

                Text(title)
                    .font(.system(size: 16))
                    .foregroundStyle(Color(hex: "#F3F4F6"))
            }

            Spacer()

            Text(badge)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(Color(hex: "#7AF3A8"))
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color(hex: "#0C542B").opacity(0.30))
                .clipShape(Capsule())
        }
    }
}

private struct ChecklistRow: View {
    let title: String
    @Binding var checked: Bool

    var body: some View {
        Button {
            checked.toggle()
        } label: {
            HStack(alignment: .top, spacing: 12) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(checked ? Color(hex: "#41B97D") : Color.white.opacity(0.15))
                    .frame(width: 16, height: 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(checked ? Color(hex: "#41B97D") : Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .overlay(
                        Group {
                            if checked {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundStyle(.white)
                            }
                        }
                    )
                    .padding(.top, 3)

                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color(hex: "#F3F4F6"))
                    .multilineTextAlignment(.leading)

                Spacer()
            }
        }
        .buttonStyle(.plain)
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
    OnboardingStep6ChecklistView()
}
