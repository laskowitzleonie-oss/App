//
//  Session Schritt 5.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct OnboardingStep5PreviewView: View {
    private let bg = Color(hex: "#020815")
    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let textPrimary = Color(hex: "#F3F4F6")
    private let textSecondary = Color(hex: "#99A1B3")
    private let accent = Color(hex: "#41B97D")
    private let cta = Color(hex: "#00BBA5")

    @State private var selectedClip = 0

    private let clips: [ClipItem] = [
        .init(title: "Übung 1: Einführung", duration: "2:30", imageName: "Container-1-45fa47d1-6ee9-4073-b1af-0fef125bf2f7"),
        .init(title: "Übung 2: Warm-up", duration: "2:10", imageName: "Container-2-940d933d-869d-40c9-b298-efcd874f3837"),
        .init(title: "Übung 3: Fokus", duration: "2:45", imageName: "Container-3-d3d0a5db-a089-4724-94e7-6072a5e8a470"),
        .init(title: "Übung 4: Flow", duration: "3:05", imageName: "Container-78937646-62a1-43cd-b69a-981273f72415"),
        .init(title: "Übung 5: Cooldown", duration: "1:50", imageName: "Button-264d7905-2f2d-4888-a542-debbeff56c53")
    ]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            bg.ignoresSafeArea()

            VStack(spacing: 0) {
                progressHeader

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        backButton

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Session Preview")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(textPrimary)

                            Text("Bereite dich auf deine VR-Session vor")
                                .font(.system(size: 16))
                                .foregroundStyle(textSecondary)
                        }

                        preparationCard
                        clipsCard
                        expectationsCard

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
                    .shadow(color: .black.opacity(0.15), radius: 6, y: 4)
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
                Text("Schritt 5 von 6")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(textSecondary)

                Spacer()

                Text("83%")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(accent)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(stroke)
                    Capsule()
                        .fill(accent)
                        .frame(width: geo.size.width * 0.83)
                }
            }
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
                StepPill(label: "Preview", state: .active(number: "5"))
                Spacer()
                StepPill(label: "Check", state: .inactive(number: "6"))
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

    // MARK: Sections

    private var preparationCard: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Image("Step5Preview-aaf219b6-dab0-42c3-ae04-30535caf5c23")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .clipped()

                LinearGradient(
                    colors: [.clear, Color.black.opacity(0.6)],
                    startPoint: .top,
                    endPoint: .bottom
                )

                VStack(spacing: 10) {
                    Circle()
                        .fill(Color.black.opacity(0.35))
                        .frame(width: 64, height: 64)
                        .overlay(
                            Image(systemName: "play.fill")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(.white)
                                .offset(x: 2)
                        )

                    Text("Anzug anziehen & Brille aufsetzen")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)

                    Text("3:45 Min")
                        .font(.system(size: 14))
                        .foregroundStyle(Color(hex: "#CFF8FF"))
                }
                .padding(.bottom, 20)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Vorbereitung für VR")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(textPrimary)

                Text("Erfahre, wie du den MoCap-Anzug richtig anlegst und die VR-Brille korrekt einstellst.")
                    .font(.system(size: 14))
                    .foregroundStyle(textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(16)
        }
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(stroke, lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var clipsCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Übungsvideos")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(textPrimary)

            ZStack(alignment: .bottomLeading) {
                Image("Step5Preview-1-f6950ae4-ca8f-4a3d-a17c-c6b32dfc79c6")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                LinearGradient(
                    colors: [.clear, Color.black.opacity(0.55)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))

                VStack(alignment: .leading, spacing: 2) {
                    Text(clips[selectedClip].title)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.white)
                    Text(clips[selectedClip].duration)
                        .font(.system(size: 12))
                        .foregroundStyle(Color.white.opacity(0.8))
                }
                .padding(12)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Array(clips.enumerated()), id: \.offset) { index, clip in
                        Button {
                            selectedClip = index
                        } label: {
                            ZStack {
                                Image(clip.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 96, height: 64)
                                    .clipped()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(index == selectedClip ? Color(hex: "#00B8DB") : .clear, lineWidth: 2)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .opacity(index == selectedClip ? 1 : 0.6)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.trailing, 24)
            }

            HStack(spacing: 8) {
                ForEach(0..<5, id: \.self) { idx in
                    Capsule()
                        .fill(idx == selectedClip ? Color(hex: "#00B8DB") : Color(hex: "#344256"))
                        .frame(width: idx == selectedClip ? 24 : 8, height: 8)
                }
            }
        }
        .padding(16)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(stroke, lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var expectationsCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Was dich in VR erwartet")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(textPrimary)

            BulletRow(text: "Echtzeit-Bewegungsanalyse mit präzisem MoCap-Tracking")
            BulletRow(text: "Interaktive Anleitungen während der Übung")
            BulletRow(text: "Visuelle Feedback-Indikatoren für optimale Ausführung")
            BulletRow(text: "Detaillierte Auswertung nach der Session")
        }
        .padding(20)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(stroke, lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    // MARK: Bottom

    private var bottomBar: some View {
        VStack {
            Spacer()
            VStack {
                Button {} label: {
                    Text("Zur Checkliste")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(cta)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .buttonStyle(.plain)
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

// MARK: Reusable

private struct BulletRow: View {
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .fill(Color(hex: "#41B97D"))
                .frame(width: 6, height: 6)
                .padding(.top, 7)

            Text(text)
                .font(.system(size: 14))
                .foregroundStyle(Color(hex: "#99A1B3"))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

private struct ClipItem {
    let title: String
    let duration: String
    let imageName: String
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
    OnboardingStep5PreviewView()
}
