//
//  Gelenkwinkel Details.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct JointAngleDetailsView: View {
    private let bg = Color(hex: "#020815")
    private let panel = Color(hex: "#0F172A")
    private let stroke = Color(hex: "#1E293B")
    private let textPrimary = Color(hex: "#F3F4F6")
    private let textSecondary = Color(hex: "#99A1B3")
    private let accent = Color(hex: "#00D6BF")

    @State private var selectedJoint: JointMetric = .rightElbow

    var body: some View {
        ZStack {
            bg.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    header
                    bodyMapCard
                    metricGrid
                    exportButton
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Button {} label: {
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                        Text("Zurück")
                            .font(.system(size: 14, weight: .medium))
                    }
                    .foregroundStyle(.white)
                }
                .buttonStyle(.plain)

                Spacer()
            }

            Text("Gelenkwinkel Details")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .padding(.top, 14)
        }
        .padding(.horizontal, 24)
        .padding(.top, 48)
        .padding(.bottom, 24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "#00BBA5"))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    // MARK: Body map

    private var bodyMapCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Gelenkwinkel Übersicht")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(textPrimary)

            Text("Tippe auf einen Gelenkpunkt für Details")
                .font(.system(size: 14))
                .foregroundStyle(textSecondary)

            ZStack {
                // Silhouette / Person
                Image("Icon") // falls du eine Silhouette hast, sonst ersetzen
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 400)
                    .opacity(0.95)

                // Hotspots
                hotspot(.rightElbow, x: 60, y: -140)
                hotspot(.leftElbow, x: -108, y: -140)
                hotspot(.rightShoulder, x: 12, y: -128)
                hotspot(.leftShoulder, x: -60, y: -128)
                hotspot(.rightKnee, x: 12, y: 40)
                hotspot(.leftKnee, x: -60, y: 40)
                hotspot(.rightBend, x: 24, y: -40)
                hotspot(.leftBend, x: -72, y: -40)
                hotspot(.rightFoot, x: 19.2, y: 120)
                hotspot(.leftFoot, x: -67.2, y: 120)
            }
            .frame(height: 500)
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(stroke, lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private func hotspot(_ joint: JointMetric, x: CGFloat, y: CGFloat) -> some View {
        Button {
            selectedJoint = joint
        } label: {
            Circle()
                .fill(joint == selectedJoint ? Color(hex: "#F0B400").opacity(0.35) : Color(hex: "#0C542B").opacity(0.30))
                .frame(width: 48, height: 48)
                .overlay(
                    Image(systemName: "plus")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                )
        }
        .buttonStyle(.plain)
        .offset(x: x, y: y)
    }

    // MARK: Grid

    private var metricGrid: some View {
        let items = JointMetric.allCases

        return LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            ForEach(items, id: \.self) { metric in
                metricCard(metric)
            }
        }
    }

    private func metricCard(_ metric: JointMetric) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(metric.title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(textPrimary)

                Spacer()

                Image(systemName: "plus.circle")
                    .foregroundStyle(Color(hex: "#8FA0B8"))
            }

            Text(metric.value)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(accent)

            Text(metric.normalRange)
                .font(.system(size: 12))
                .foregroundStyle(textSecondary)

            HStack(spacing: 4) {
                Text("Details")
                    .font(.system(size: 12))
                    .foregroundStyle(Color(hex: "#6B7280"))
                Image(systemName: "chevron.right")
                    .font(.system(size: 10))
                    .foregroundStyle(Color(hex: "#6B7280"))
            }
            .padding(.top, 2)
        }
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 209, alignment: .topLeading)
        .background(panel)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(metric == selectedJoint ? Color(hex: "#00D6BF") : stroke, lineWidth: metric == selectedJoint ? 1.3 : 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    // MARK: Export

    private var exportButton: some View {
        Button {} label: {
            HStack(spacing: 10) {
                Image(systemName: "arrow.down.doc.fill")
                    .font(.system(size: 16))
                Text("Report exportieren (PDF)")
                    .font(.system(size: 14, weight: .medium))
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 36)
            .background(Color(hex: "#AA45FF"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.plain)
        .padding(.top, 4)
    }
}

// MARK: Model

private enum JointMetric: CaseIterable {
    case rightElbow
    case leftElbow
    case rightShoulder
    case leftShoulder
    case rightKnee
    case leftKnee
    case rightBend
    case leftBend
    case rightFoot
    case leftFoot

    var title: String {
        switch self {
        case .rightElbow: return "Rechter Ellbogen"
        case .leftElbow: return "Linker Ellbogen"
        case .rightShoulder: return "Rechte Schulter"
        case .leftShoulder: return "Linke Schulter"
        case .rightKnee: return "Rechtes Knie"
        case .leftKnee: return "Linkes Knie"
        case .rightBend: return "Beuge Rechts"
        case .leftBend: return "Beuge Links"
        case .rightFoot: return "Rechter Fuß"
        case .leftFoot: return "Linker Fuß"
        }
    }

    var value: String {
        switch self {
        case .rightElbow: return "142°"
        case .leftElbow: return "138°"
        case .rightShoulder: return "88°"
        case .leftShoulder: return "92°"
        case .rightKnee: return "165°"
        case .leftKnee: return "158°"
        case .rightBend: return "85°"
        case .leftBend: return "82°"
        case .rightFoot: return "105°"
        case .leftFoot: return "102°"
        }
    }

    var normalRange: String {
        switch self {
        case .rightElbow, .leftElbow:
            return "Normal: 135°–150°"
        case .rightShoulder, .leftShoulder:
            return "Normal: 85°–95°"
        case .rightKnee, .leftKnee:
            return "Normal: 160°–175°"
        case .rightBend, .leftBend:
            return "Normal: 80°–90°"
        case .rightFoot, .leftFoot:
            return "Normal: 95°–110°"
        }
    }
}

// MARK: Helper

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
    JointAngleDetailsView()
}
