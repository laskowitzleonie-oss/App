//
//  Community.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 28.02.26.
//

import SwiftUI

struct ChatScreenView: View {
    @State private var selectedTopTab: TopTab = .kiChat
    @State private var messageText: String = ""

    private let bg = Color(hex: "#020815")
    private let headerGreen = Color(hex: "#41B97D")
    private let panel = Color(hex: "#0F172A")
    private let panelStroke = Color(hex: "#1E293B")
    private let subtleText = Color(hex: "#99A1B3")
    private let activeText = Color(hex: "#F8FAFC")

    var body: some View {
        ZStack(alignment: .bottom) {
            bg.ignoresSafeArea()

            VStack(spacing: 0) {
                header
                chatContent
            }

            bottomNavigation
        }
    }

    // MARK: - Header

    private var header: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Chat")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)

                segmentedTopTabs
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.top, 48)
            .padding(.bottom, 12)
            .background(headerGreen)
            .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))

            Button {} label: {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color.yellow)
                    .frame(width: 40, height: 40)
                    .background(Color(hex: "#061534"))
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
            }
            .padding(.trailing, 16)
            .padding(.top, 16)
        }
    }

    private var segmentedTopTabs: some View {
        HStack(spacing: 0) {
            tabButton(title: "KI-Chat", icon: "briefcase", tab: .kiChat)
            tabButton(title: "Trainer-Chat", icon: "person", tab: .trainerChat)
        }
        .padding(3)
        .background(Color(hex: "#0F172A"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.1), radius: 6, y: 4)
    }

    private func tabButton(title: String, icon: String, tab: TopTab) -> some View {
        Button {
            selectedTopTab = tab
        } label: {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 13))
                Text(title)
                    .font(.system(size: 14, weight: .medium))
            }
            .foregroundStyle(selectedTopTab == tab ? activeText : Color(hex: "#A1A1AA"))
            .frame(maxWidth: .infinity)
            .frame(height: 29)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(selectedTopTab == tab ? Color.white.opacity(0.12) : .clear)
            )
        }
    }

    // MARK: - Content

    private var chatContent: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                messageIncoming(
                    "Hallo **Selina**! 👋 Wie kann ich dir heute helfen?",
                    time: "10:32",
                    width: 314
                )

                messageOutgoing(
                    "Wie war meine letzte Yoga-Session?",
                    time: "10:33",
                    width: 266
                )

                messageIncoming(
                    "Deine letzte Yoga-Session (Warrior III) war sehr gut! Du hast einen Score von 87 erreicht. Besonders deine Balance hat sich um 12% verbessert. Möchtest du die Details sehen?",
                    time: "10:33",
                    width: 314
                )

                sessionCard

                quickReplies

                inputRow
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 110)
        }
    }

    private func messageIncoming(_ text: String, time: String, width: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(.init(text))
                .font(.system(size: 14))
                .foregroundStyle(Color(hex: "#F3F4F6"))
                .fixedSize(horizontal: false, vertical: true)

            Text(time)
                .font(.system(size: 12))
                .foregroundStyle(subtleText)
        }
        .padding(.horizontal, 16)
        .padding(.top, 12.6)
        .padding(.bottom, 8)
        .frame(maxWidth: width, alignment: .leading)
        .background(panel)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(panelStroke, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private func messageOutgoing(_ text: String, time: String, width: CGFloat) -> some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: 4) {
                Text(text)
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
                    .fixedSize(horizontal: false, vertical: true)

                Text(time)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.white.opacity(0.7))
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 8)
            .frame(maxWidth: width, alignment: .leading)
            .background(headerGreen)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }

    private var sessionCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Session: Warrior III")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color(hex: "#F3F4F6"))

            HStack {
                Text("Score:")
                    .foregroundStyle(subtleText)
                Text("87")
                    .foregroundStyle(headerGreen)
                    .fontWeight(.bold)

                Spacer()

                Text("Dauer:")
                    .foregroundStyle(subtleText)
                Text("25 Min")
                    .foregroundStyle(Color(hex: "#D7D4E8"))
                    .fontWeight(.semibold)
            }
            .font(.system(size: 14))

            Button {} label: {
                Text("Details anzeigen")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 32)
                    .background(headerGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(16)
        .background(Color(hex: "#E8F4C0"))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "#E8F4C0"), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var quickReplies: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                quickReplyChip("Wie war meine letzte Session?")
                quickReplyChip("Tipps für bessere Balance")
                quickReplyChip("Trainingsplan anpassen")
                quickReplyChip("Fortschritt anzeigen")
            }
            .padding(.trailing, 24)
        }
    }

    private func quickReplyChip(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 12, weight: .medium))
            .foregroundStyle(Color(hex: "#D1D5DB"))
            .padding(.horizontal, 12)
            .frame(height: 33)
            .background(panel)
            .overlay(
                Capsule()
                    .stroke(panelStroke, lineWidth: 1)
            )
            .clipShape(Capsule())
    }

    private var inputRow: some View {
        HStack(spacing: 8) {
            TextField("", text: $messageText, prompt: Text("Nachricht schreiben...").foregroundStyle(Color(hex: "#A1A1AA")))
                .font(.system(size: 16))
                .foregroundStyle(Color(hex: "#E5E7EB"))
                .padding(.horizontal, 12)
                .frame(height: 36)
                .background(panel)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(panelStroke, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Button {} label: {
                Image(systemName: "paperplane")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 36)
                    .background(headerGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }

    // MARK: - Bottom Nav

    private var bottomNavigation: some View {
        HStack {
            BottomItem(icon: "house", title: "Home", active: false)
            BottomItem(icon: "figure.strengthtraining.traditional", title: "Training", active: false)
            BottomItem(icon: "person.2", title: "Community", active: false)
            BottomItem(icon: "bubble.left", title: "Chat", active: true)
            BottomItem(icon: "person", title: "Profil", active: false)
        }
        .padding(.horizontal, 14)
        .padding(.top, 10)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity)
        .background(Color(hex: "#0F172A"))
        .overlay(alignment: .top) {
            Rectangle().fill(panelStroke).frame(height: 1)
        }
    }
}

// MARK: - Small Types

private enum TopTab {
    case kiChat
    case trainerChat
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
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    ChatScreenView()
}
