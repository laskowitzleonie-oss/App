//
//  LogIn Start.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct ProfileLoginTeaserView: View {
    var body: some View {
        ZStack {
            Color(red: 0.86, green: 0.99, blue: 1.00)
                .ignoresSafeArea()

            VStack {
                ZStack {
                    // MARK: Logo + Claim
                    VStack(spacing: 8) {
                        Text("ATHLYZE MOVREAL")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundStyle(Color(red: 0.27, green: 0.27, blue: 0.27))
                            .multilineTextAlignment(.center)
                            .frame(height: 120)

                        Text("Data-Driven Motion\nVirtual Precision")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(Color(red: 0.29, green: 0.33, blue: 0.40))
                            .multilineTextAlignment(.center)
                            .lineSpacing(9)
                    }
                    .frame(width: 345.58, height: 154.99)
                    .offset(y: -218.2)

                    // MARK: White profile card
                    VStack(alignment: .leading, spacing: 24) {
                        // Header in Card
                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color(red: 0.25, green: 0.73, blue: 0.49))
                                .frame(width: 64, height: 64)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 28))
                                        .foregroundStyle(.white)
                                )

                            VStack(alignment: .leading, spacing: 0) {
                                Text("Profil")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundStyle(Color(red: 0.06, green: 0.09, blue: 0.16))

                                Text("Dein Fitness-Hub")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color(red: 0.42, green: 0.45, blue: 0.51))
                            }
                        }

                        // Login teaser row
                        Button {
                            // TODO: Login öffnen
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Selina Laskowitz")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(Color(red: 0.06, green: 0.09, blue: 0.16))

                                    Text("Tippe, um dich mit der Community zu verbinden")
                                        .font(.system(size: 13))
                                        .foregroundStyle(Color(red: 0.42, green: 0.45, blue: 0.51))
                                        .multilineTextAlignment(.leading)
                                }

                                Spacer()

                                Text("→")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(Color(red: 0.22, green: 0.76, blue: 0.88))
                            }
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity, minHeight: 114.96)
                            .background(Color(red: 0.95, green: 0.95, blue: 0.96))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        .buttonStyle(.plain)

                        // Stats
                        HStack {
                            stat(value: "127", label: "Sessions")
                            Spacer()
                            stat(value: "2450", label: "Punkte")
                            Spacer()
                            stat(value: "24", label: "Wochen")
                        }
                        .padding(.horizontal, 8)
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 32)
                    .frame(width: 345.58, height: 344.92, alignment: .top)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.10), radius: 6, y: 4)
                    .offset(y: 79.76)

                    // Hint unten
                    Text("Tap auf deinen Namen, um den Login zu öffnen")
                        .font(.system(size: 13))
                        .foregroundStyle(Color(red: 0.60, green: 0.63, blue: 0.69))
                        .multilineTextAlignment(.center)
                        .offset(y: 285.95)
                }
                .frame(width: 345.58, height: 591.39)
            }
            .frame(width: 393, height: 852)
        }
    }

    private func stat(value: String, label: String) -> some View {
        VStack(spacing: 0) {
            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(Color(red: 0.06, green: 0.09, blue: 0.16))

            Text(label)
                .font(.system(size: 12))
                .foregroundStyle(Color(red: 0.42, green: 0.45, blue: 0.51))
        }
        .frame(width: 83.2, height: 54)
    }
}

#Preview {
    ProfileLoginTeaserView()
}
