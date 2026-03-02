//
//  LogIn Maske.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct CommunityLoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    private let textPrimary = Color(hex: "#101828")
    private let textSecondary = Color(hex: "#6A7282")
    private let accent = Color(hex: "#38C3E1")
    private let green = Color(hex: "#41B97D")
    private let fieldBg = Color(hex: "#F2F2F4")

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 0) {
                // Top spacing similar to design
                Spacer().frame(height: 24)

                // Back
                HStack(spacing: 8) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(textSecondary)

                    Text("Zurück")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(textSecondary)

                    Spacer()
                }
                .padding(.horizontal, 24)
                .frame(height: 36)

                Spacer().frame(height: 24)

                // Main content card area
                VStack(alignment: .leading, spacing: 20) {
                    // Avatar icon
                    Circle()
                        .fill(green)
                        .frame(width: 64, height: 64)
                        .overlay(
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 26))
                                .foregroundStyle(.white)
                        )

                    // Headline
                    Text("Mit der Community verbinden")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(textPrimary)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("Melde dich an, um deine Fortschritte mit anderen zu vergleichen und Teil der Community zu werden.")
                        .font(.system(size: 15))
                        .foregroundStyle(textSecondary)
                        .fixedSize(horizontal: false, vertical: true)

                    // Form
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("E-Mail")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(textPrimary)

                            TextField("deine@email.com", text: $email)
                                .font(.system(size: 15))
                                .foregroundStyle(textSecondary)
                                .padding(.horizontal, 12)
                                .frame(height: 48)
                                .background(fieldBg)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Passwort")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(textPrimary)

                            SecureField("••••••••", text: $password)
                                .font(.system(size: 15))
                                .foregroundStyle(textSecondary)
                                .padding(.horizontal, 12)
                                .frame(height: 48)
                                .background(fieldBg)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }

                        Button("Passwort vergessen?") {}
                            .font(.system(size: 13))
                            .foregroundStyle(accent)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Button("Einloggen") {}
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(green)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }

                    // Register
                    HStack(spacing: 4) {
                        Text("Noch keinen Account?")
                            .font(.system(size: 14))
                            .foregroundStyle(textSecondary)

                        Button("Registrieren") {}
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(accent)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)

                    // Info box
                    Text("Der Login ist optional und wird nur für Community-Vergleiche benötigt. Du kannst die App auch ohne Account vollständig nutzen.")
                        .font(.system(size: 12))
                        .foregroundStyle(textSecondary)
                        .padding(.top, 16)
                        .padding(.horizontal, 12)
                        .padding(.bottom, 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(Color(hex: "#E5E7EB"), lineWidth: 1)
                        )
                }
                .padding(.horizontal, 24)

                Spacer()
            }
            .frame(width: 373, height: 863)
        }
        .frame(width: 373, height: 863)
    }
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

        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: 1)
    }
}

#Preview {
    CommunityLoginView()
}
