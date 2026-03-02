//
//  Session Schritt 4.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct OnboardingAvatarScreenView: View {
    private let bg = Color(hex: "#020815")
    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let textPrimary = Color(hex: "#F3F4F6")
    private let textSecondary = Color(hex: "#99A1B3")
    private let accent = Color(hex: "#41B97D")

    @State private var selectedBaseId: UUID?
    @State private var selectedHairId: UUID?
    @State private var selectedBodyType: BodyType = .athletisch

    private let baseOptions: [AvatarOption] = [
        .init(label: "weiblich", imageName: "Card-1-2d9dba39-6c5f-4a5e-8a6e-c8d723e7f385"),
        .init(label: "weiblich", imageName: "Card-2-d932f555-facd-4585-ba4a-6f1e57345289"),
        .init(label: "weiblich", imageName: "Card-3-78285d35-7271-4bbd-a26f-5215dde9f742"),
        .init(label: "männlich", imageName: "Card-4-a865034f-c1d6-4f49-8cb7-5a6fcbc81912"),
        .init(label: "männlich", imageName: "Card-5-aa064abc-7a6b-4f23-b22c-a59a78c5dc03"),
        .init(label: "männlich", imageName: "Card-6-3a4ac1fe-9d39-4f3e-b094-17b299989e4f")
    ]

    private let hairOptions: [AvatarOption] = [
        .init(label: "Kurz", imageName: "Card-7-1dfcb81a-9a20-46cf-937d-f0d8bccee6b7"),
        .init(label: "Mittel", imageName: "Card-8-58a379b0-98d5-4462-891e-9191d92add0d"),
        .init(label: "Lang", imageName: "Card-9-153bb14a-065e-4f2c-89fa-150717bff9c3"),
        .init(label: "Zopf", imageName: "Card-10-cdd10e77-fb22-42c1-8f89-18fe71cbec25"),
        .init(label: "Dutt", imageName: "Card-11-615fa106-069d-45ef-abd0-697dbdff2243"),
        .init(label: "Offen", imageName: "Card-12-18652713-a4de-486a-b8a8-6b8d834263d6")
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
                            Text("Erstelle deinen Avatar")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(textPrimary)

                            Text("Passe deinen virtuellen Charakter an")
                                .font(.system(size: 16))
                                .foregroundStyle(textSecondary)
                        }

                        previewCard

                        sectionTitle("Avatar-Basis wählen")
                        grid(options: baseOptions, selectedId: $selectedBaseId)

                        sectionTitle("Statur")
                        bodyTypePicker

                        sectionTitle("Frisur")
                        grid(options: hairOptions, selectedId: $selectedHairId)

                        Spacer(minLength: 120)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                }
            }

            // top-right action
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
        .onAppear {
            selectedBaseId = baseOptions.first?.id
            selectedHairId = hairOptions.first?.id
        }
    }

    // MARK: - Header / Progress

    private var progressHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Schritt 4 von 6")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(textSecondary)
                Spacer()
                Text("67%")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(accent)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(stroke)
                    Capsule()
                        .fill(accent)
                        .frame(width: geo.size.width * 0.67)
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
                StepPill(label: "Avatar", state: .active(number: "4"))
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
        }
        .buttonStyle(.plain)
    }

    // MARK: - Content blocks

    private var previewCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.08))
                .frame(height: 197)

            // Wenn du ein großes Preview-Bild hast, hier einsetzen:
            // Image("Card-b95c69a9-ba78-48cd-8e6a-f4570cb549ee")
            //   .resizable().scaledToFit().padding(16)
            Image("Card-b95c69a9-ba78-48cd-8e6a-f4570cb549ee")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 165)
                .padding(.horizontal, 12)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(stroke, lineWidth: 1)
        )
    }

    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(textPrimary)
    }

    private func grid(options: [AvatarOption], selectedId: Binding<UUID?>) -> some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 3), spacing: 12) {
            ForEach(options) { option in
                Button {
                    selectedId.wrappedValue = option.id
                } label: {
                    VStack(spacing: 8) {
                        Image(option.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 72)
                            .clipped()
                            .cornerRadius(8)

                        Text(option.label)
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, minHeight: 113, alignment: .top)
                    .background(Color.white.opacity(0.08))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                selectedId.wrappedValue == option.id ? Color(hex: "#E5E7EB") : stroke,
                                lineWidth: selectedId.wrappedValue == option.id ? 1.5 : 1
                            )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .buttonStyle(.plain)
            }
        }
    }

    private var bodyTypePicker: some View {
        HStack(spacing: 12) {
            bodyTypeChip(.schlank, title: "Schlank")
            bodyTypeChip(.athletisch, title: "Athletisch")
            bodyTypeChip(.kraftig, title: "Kräftig")
        }
    }

    private func bodyTypeChip(_ type: BodyType, title: String) -> some View {
        Button {
            selectedBodyType = type
        } label: {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(selectedBodyType == type ? .white : Color(hex: "#D1D5DB"))
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(selectedBodyType == type ? accent : panel)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(selectedBodyType == type ? accent : stroke, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
    }

    // MARK: - Bottom

    private var bottomBar: some View {
        VStack {
            Spacer()
            VStack {
                Button {} label: {
                    Text("Weiter")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(accent)
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

// MARK: - Subtypes

private enum BodyType {
    case schlank, athletisch, kraftig
}

private struct AvatarOption: Identifiable {
    let id = UUID()
    let label: String
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
    OnboardingAvatarScreenView()
}
