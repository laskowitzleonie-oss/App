//
//  Sesion Schritt 1.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct OnboardingSportSelectionView: View {
    private let bg = Color(hex: "#020815")
    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let textPrimary = Color(hex: "#F3F4F6")
    private let textSecondary = Color(hex: "#99A1B3")
    private let accent = Color(hex: "#41B97D")

    // Asset-Namen ggf. in Xcode anpassen
    private let sports: [SportOption] = [
        .init(
            title: "Yoga",
            subtitle: "Balance, Flexibilität & Achtsamkeit",
            imageName: "ImageWithFallback-3-3971ddf3-861f-4684-be04-252ca1340446",
            overlay: Color(hex: "#454545").opacity(0.55)
        ),
        .init(
            title: "Kampfsport",
            subtitle: "Technik, Kraft & Präzision",
            imageName: "ImageWithFallback-2-ce58cdc4-d344-4b63-aa35-86667e416afd",
            overlay: Color(hex: "#1F2937").opacity(0.60)
        ),
        .init(
            title: "Physiotherapie",
            subtitle: "Rehabilitation & Mobilität",
            imageName: "ImageWithFallback-987a474f-2aaf-402c-bbf5-7a27e7f60f68",
            overlay: Color(hex: "#454545").opacity(0.55)
        ),
        .init(
            title: "Tanz",
            subtitle: "Rhythmus, Flow & Ausdruck",
            imageName: "ImageWithFallback-1-a01786e8-8b3a-4ae4-bd5d-aefb751248b0",
            overlay: Color(hex: "#1F2937").opacity(0.60)
        )
    ]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            bg.ignoresSafeArea()

            VStack(spacing: 0) {
                progressHeader
                content
            }

            // Optionaler Action-Button rechts oben
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
            .padding(.trailing, 16)
            .padding(.top, 14)
        }
    }

    private var progressHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Schritt 1 von 6")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(textSecondary)
                Spacer()
                Text("17%")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(accent)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(stroke)
                    Capsule().fill(accent)
                        .frame(width: geo.size.width * 0.17)
                }
            }
            .frame(height: 8)

            HStack {
                StepDot(number: "1", label: "Sportart", active: true)
                Spacer()
                StepDot(number: "2", label: "Übung", active: false)
                Spacer()
                StepDot(number: "3", label: "Raum", active: false)
                Spacer()
                StepDot(number: "4", label: "Avatar", active: false)
                Spacer()
                StepDot(number: "5", label: "Preview", active: false)
                Spacer()
                StepDot(number: "6", label: "Check", active: false)
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

    private var content: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Wähle deine Sportart")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(textPrimary)

                    Text("Welchen Bereich möchtest du heute trainieren?")
                        .font(.system(size: 16))
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: 16) {
                    ForEach(sports) { sport in
                        SportCard(option: sport)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom, 24)
        }
    }
}

// MARK: - Components

private struct StepDot: View {
    let number: String
    let label: String
    let active: Bool

    var body: some View {
        VStack(spacing: 4) {
            Text(number)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(active ? .white : Color(hex: "#4A5565"))
                .frame(width: 32, height: 32)
                .background(active ? Color(hex: "#41B97D") : Color(hex: "#1E293B"))
                .clipShape(Circle())

            Text(label)
                .font(.system(size: 12))
                .foregroundStyle(Color(hex: "#99A1B3"))
        }
    }
}

private struct SportCard: View {
    let option: SportOption

    var body: some View {
        Button {} label: {
            ZStack(alignment: .leading) {
                Image(option.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 128)
                    .clipped()

                option.overlay

                VStack(alignment: .leading, spacing: 4) {
                    Text(option.title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)

                    Text(option.subtitle)
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                }
                .padding(.leading, 24)
                .padding(.trailing, 16)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 128)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(hex: "#E5E7EB"), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Model

private struct SportOption: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let overlay: Color
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
    OnboardingSportSelectionView()
}
