//
//  Session Schritt 2.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct OnboardingExerciseSelectionView: View {
    private let bg = Color(hex: "#020815")
    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let textPrimary = Color(hex: "#F3F4F6")
    private let textSecondary = Color(hex: "#99A1B3")
    private let accent = Color(hex: "#41B97D")

    @State private var selectedExerciseId: UUID?

    // Asset-Namen ggf. in Xcode exakt anpassen
    private let exercises: [ExerciseItem] = [
        .init(
            title: "Virabhadrasana III",
            level: "Mittel",
            duration: "15 Min",
            focus: "Balance",
            imageName: "ImageWithFallback-3-194d1c87-e0ea-44b9-bf5d-f9e5c2fa3125"
        ),
        .init(
            title: "Virabhadrasana II",
            level: "Einfach",
            duration: "10 Min",
            focus: "Rücken",
            imageName: "ImageWithFallback-2-aa4684c0-07ea-4833-83e5-2782300e46ff"
        ),
        .init(
            title: "Vrikshasana",
            level: "Einfach",
            duration: "12 Min",
            focus: "Ganzkörper",
            imageName: "ImageWithFallback-bad092b4-9a62-40cb-bbc7-558d5889fd92"
        ),
        .init(
            title: "Utkatasana",
            level: "Mittel",
            duration: "15 Min",
            focus: "Kraft",
            imageName: "ImageWithFallback-1-6c4e4a87-8d14-4dd9-a2f8-a2149faca0a4"
        ),
        .init(
            title: "Bhujangasana",
            level: "Einfach",
            duration: "8 Min",
            focus: "Mobilität",
            imageName: "ImageWithFallback-4-1e63c2cf-6167-4787-b3c5-5e2bc6e48a6f"
        )
    ]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            bg.ignoresSafeArea()

            VStack(spacing: 0) {
                progressHeader
                content
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
        }
    }

    // MARK: - Header

    private var progressHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Schritt 2 von 6")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(textSecondary)
                Spacer()
                Text("33%")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(accent)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(stroke)
                    Capsule()
                        .fill(accent)
                        .frame(width: geo.size.width * 0.33)
                }
            }
            .frame(height: 8)

            HStack {
                StepPill(label: "Sportart", state: .done)
                Spacer()
                StepPill(label: "Übung", state: .active(number: "2"))
                Spacer()
                StepPill(label: "Raum", state: .inactive(number: "3"))
                Spacer()
                StepPill(label: "Avatar", state: .inactive(number: "4"))
                Spacer()
                StepPill(label: "Preview", state: .inactive(number: "5"))
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

    // MARK: - Content

    private var content: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                backButton

                VStack(alignment: .leading, spacing: 8) {
                    Text("Wähle deine Übung")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(textPrimary)

                    Text("Welche Übung möchtest du trainieren?")
                        .font(.system(size: 16))
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: 12) {
                    ForEach(exercises) { item in
                        ExerciseSelectionCard(
                            item: item,
                            isSelected: selectedExerciseId == item.id,
                            onTap: { selectedExerciseId = item.id }
                        )
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 24)
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
            .frame(height: 36)
            .padding(.horizontal, 12)
            .background(Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Components

private struct ExerciseSelectionCard: View {
    let item: ExerciseItem
    let isSelected: Bool
    let onTap: () -> Void

    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let selected = Color(hex: "#41B97D")
    private let textPrimary = Color(hex: "#F3F4F6")
    private let textSecondary = Color(hex: "#99A1B3")

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 96, height: 96)
                    .clipped()

                VStack(alignment: .leading, spacing: 8) {
                    Text(item.title)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(textPrimary)
                        .lineLimit(1)

                    HStack(spacing: 12) {
                        Meta(label: item.level)
                        Meta(label: item.duration)
                        Meta(label: item.focus)
                    }
                }

                Spacer()
            }
            .padding(1)
            .background(panel)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? selected : stroke, lineWidth: isSelected ? 1.5 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }

    private struct Meta: View {
        let label: String
        var body: some View {
            HStack(spacing: 4) {
                Circle()
                    .fill(Color(hex: "#6B7280"))
                    .frame(width: 4, height: 4)
                Text(label)
                    .font(.system(size: 12))
                    .foregroundStyle(Color(hex: "#99A1B3"))
            }
        }
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

// MARK: - Model

private struct ExerciseItem: Identifiable {
    let id = UUID()
    let title: String
    let level: String
    let duration: String
    let focus: String
    let imageName: String
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

#Preview {
    OnboardingExerciseSelectionView()
}
