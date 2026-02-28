//
//  Training.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 28.02.26.
//

import SwiftUI

struct TrainingScreenView: View {
    private let exercises: [ExerciseItem] = [
        .init(
            title: "Ganganalyse",
            level: "Einfach",
            duration: "5 Min",
            category: "Ganganalyse",
            imageURL: "https://www.figma.com/api/mcp/asset/3fb9798f-927b-459e-b82c-06dc32fe2cdf"
        ),
        .init(
            title: "Schultermobilität",
            level: "Einfach",
            duration: "5 Min",
            category: "Schultermobilität",
            imageURL: "https://www.figma.com/api/mcp/asset/c35e96f8-af44-4a9b-9f03-af0dab2bf75f"
        ),
        .init(
            title: "Rumpfvorbeuge",
            level: "Einfach",
            duration: "8 Min",
            category: "Rücken",
            imageURL: "https://www.figma.com/api/mcp/asset/5cda8560-cce2-414e-a8ad-1a656caa1aeb"
        ),
        .init(
            title: "Knieheben im Einbeinstand",
            level: "Mittel",
            duration: "10 Min",
            category: "Balance",
            imageURL: "https://www.figma.com/api/mcp/asset/bbe5421a-b6a4-4ba0-b9eb-dd047ea1d0c2"
        ),
        .init(
            title: "Kniebeuge",
            level: "Mittel",
            duration: "10 Min",
            category: "Schultermobilität",
            imageURL: "https://www.figma.com/api/mcp/asset/67ff82a9-1d50-4547-b2b9-9cbf7b2b63ca"
        )
    ]

    var body: some View {
        ZStack {
            Color(hex: "#F9FAFB").ignoresSafeArea()

            VStack(spacing: 0) {
                headerSection

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        categoryTabs

                        ForEach(exercises) { item in
                            ExerciseCard(item: item)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                }
            }
        }
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Training")
                .font(.system(size: 40 * 0.6, weight: .bold))
                .foregroundStyle(Color(hex: "#101828"))

            searchField

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    FilterChip(title: "Einfach", isSelected: false)
                    FilterChip(title: "Mittel", isSelected: true)
                    FilterChip(title: "Fortgeschritten", isSelected: false)
                    FilterChip(title: "< 10 Min", isSelected: false)
                    FilterChip(title: "10-15 Min", isSelected: false)
                    FilterChip(title: "> 15 Min", isSelected: false)
                }
                .padding(.trailing, 16)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 48)
        .padding(.bottom, 16)
        .background(.white)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Color(hex: "#E5E7EB"))
                .frame(height: 1)
        }
    }

    private var searchField: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(Color(hex: "#94A3B8"))

            Text("Übung suchen...")
                .font(.system(size: 16))
                .foregroundStyle(Color(hex: "#64748B"))

            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(height: 36)
        .background(Color(hex: "#F9FAFB"))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#E5E7EB"), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    private var categoryTabs: some View {
        HStack(spacing: 0) {
            CategoryTab(title: "Yoga", isSelected: false)
            CategoryTab(title: "Kampfsport", isSelected: false)
            CategoryTab(title: "Physio", isSelected: true)
            CategoryTab(title: "Tanz", isSelected: false)
        }
        .padding(3)
        .background(Color(hex: "#F3F4F6"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: - Subviews

private struct FilterChip: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium))
            .foregroundStyle(isSelected ? .white : Color(hex: "#364153"))
            .padding(.horizontal, 14)
            .frame(height: 32)
            .background(isSelected ? Color(hex: "#41B97D") : Color(hex: "#F3F4F6"))
            .clipShape(Capsule())
    }
}

private struct CategoryTab: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium))
            .foregroundStyle(Color(hex: "#454545"))
            .frame(maxWidth: .infinity)
            .frame(height: 29)
            .background(isSelected ? .white : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

private struct ExerciseCard: View {
    let item: ExerciseItem

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: item.imageURL)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure(_):
                    Color(hex: "#E5E7EB")
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundStyle(Color.gray)
                        )
                default:
                    ProgressView()
                }
            }
            .frame(width: 96, height: 96)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color(hex: "#101828"))
                    .lineLimit(1)

                HStack(spacing: 12) {
                    MetaItem(icon: "bolt", text: item.level)
                    MetaItem(icon: "clock", text: item.duration)
                    MetaItem(icon: "scope", text: item.category)
                }

                HStack(spacing: 8) {
                    Button("Details") {}
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Color(hex: "#454545"))
                        .frame(height: 32)
                        .padding(.horizontal, 14)
                        .background(Color(hex: "#FAFAFA"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "#E2E8F0"), lineWidth: 1)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    Button("Starten") {}
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(height: 32)
                        .padding(.horizontal, 16)
                        .background(Color(hex: "#41B97D"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }

            Spacer(minLength: 0)
        }
        .padding(1)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "#E5E7EB"), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

private struct MetaItem: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 11))
            Text(text)
                .font(.system(size: 12))
        }
        .foregroundStyle(Color(hex: "#4A5565"))
    }
}

// MARK: - Model

private struct ExerciseItem: Identifiable {
    let id = UUID()
    let title: String
    let level: String
    let duration: String
    let category: String
    let imageURL: String
}

// MARK: - Helper

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
    TrainingScreenView()
}
