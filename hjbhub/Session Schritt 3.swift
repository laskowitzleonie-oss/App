//
//  Session Schritt 3.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct OnboardingRoomSelectionView: View {
    private let bg = Color(hex: "#020815")
    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let textPrimary = Color(hex: "#F3F4F6")
    private let textSecondary = Color(hex: "#99A1B3")
    private let accent = Color(hex: "#41B97D")

    @State private var selectedRoomId: UUID?

    // Asset-Namen ggf. in Xcode exakt anpassen
    private let rooms: [RoomOption] = [
        .init(
            title: "Zen-Hall",
            subtitle: "Ruhig & minimalistisch",
            imageName: "Container-1-57f28c46-407f-4993-bec1-3cab2c71d283",
            tint: Color(hex: "#02DE73").opacity(0.22)
        ),
        .init(
            title: "Dojo-Hall",
            subtitle: "Traditionell & fokussiert",
            imageName: "Container-2-d2186ce0-6f36-4841-98d5-7b85e2c30afe",
            tint: Color.black.opacity(0.28)
        ),
        .init(
            title: "Healing-Hall",
            subtitle: "Therapeutisch & beruhigend",
            imageName: "Container-653e994b-132f-4db9-a251-2440e56b128f",
            tint: Color(hex: "#52A4FF").opacity(0.22)
        )
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
                            Text("Wähle deinen VR-Raum")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(textPrimary)

                            Text("In welcher Umgebung möchtest du trainieren?")
                                .font(.system(size: 16))
                                .foregroundStyle(textSecondary)
                        }

                        VStack(spacing: 16) {
                            ForEach(rooms) { room in
                                RoomCard(
                                    option: room,
                                    isSelected: selectedRoomId == room.id,
                                    onTap: { selectedRoomId = room.id }
                                )
                            }
                        }
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
        }
        .onAppear {
            selectedRoomId = rooms.first?.id
        }
    }

    private var progressHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Schritt 3 von 6")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(textSecondary)
                Spacer()
                Text("50%")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(accent)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(stroke)
                    Capsule()
                        .fill(accent)
                        .frame(width: geo.size.width * 0.50)
                }
            }
            .frame(height: 8)

            HStack {
                StepPill(label: "Sportart", state: .done)
                Spacer()
                StepPill(label: "Übung", state: .done)
                Spacer()
                StepPill(label: "Raum", state: .active(number: "3"))
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

private struct RoomCard: View {
    let option: RoomOption
    let isSelected: Bool
    let onTap: () -> Void

    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let selected = Color(hex: "#41B97D")

    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .bottomLeading) {
                Image(option.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 192)
                    .clipped()

                option.tint

                LinearGradient(
                    colors: [Color.black.opacity(0.0), Color.black.opacity(0.45)],
                    startPoint: .top,
                    endPoint: .bottom
                )

                VStack(alignment: .leading, spacing: 4) {
                    Text(option.title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)

                    Text(option.subtitle)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.white.opacity(0.9))
                }
                .padding(.leading, 24)
                .padding(.bottom, 16)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 192)
            .background(panel)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? selected : stroke, lineWidth: isSelected ? 1.5 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
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

// MARK: - Model

private struct RoomOption: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let tint: Color
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
    OnboardingRoomSelectionView()
}
